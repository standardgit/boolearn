class User < ApplicationRecord
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable,
         :omniauthable

  rolify

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  has_many :courses, dependent: :nullify
  has_many :enrollments, dependent: :nullify
  has_many :user_lessons, dependent: :nullify
  has_many :Comments, dependent: :nullify

  
  def to_s
    email
  end

  def username
    if email.present?
      self.email.split(/@/).first
    end
  end

  extend FriendlyId
  friendly_id :email, use: :slugged

  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) #if anybodycan create his/her own course 
    end
  end

  validate :must_have_a_role, on: :update

  def online?
    updated_at > 2.minutes.ago
  end

  def buy_course(course)
    self.enrollments.create(course: course, price: course.price)
  end

  def view_lesson(lesson)
    user_lesson = self.user_lessons.where(lesson: lesson)
    unless user_lesson.any?
      self.user_lessons.create(lesson: lesson)
    else
      user_lesson.first.increment!(:impressions)
    end
  end

  def calculate_balance
    update_column :course_income, (courses.map(&:price).sum)
    #update_column :enrollment_expenses, (enrollments.map(&:price).sum)
    update_column :balance, (course_income - enrollment_expenses)
  end

  def calculate_enrollment_expenses
    update_column :enrollment_expenses, (enrollments.map(&:price).sum)
    update_column :balance, (course_income - enrollment_expenses)
  end

  private
  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "You must have a role.")
    end
  end

end
