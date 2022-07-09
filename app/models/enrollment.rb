class Enrollment < ApplicationRecord
  belongs_to :course, counter_cache: true
  #how to use counter_cache to update past enrollment
  #Course.find_each { |course| Course.reset_counters(courses.id, :enrollments) }
  belongs_to :user, counter_cache: true
  #User.find_each { |user| User.reset_counters(user.id, :enrollments) }

  validates :user_id, :course_id, presence: true

  validates_presence_of :rating, if: :review?
  validates_presence_of :review, if: :rating?

  validates_uniqueness_of :user_id, scope: :course_id #user can't be suscribed to the same course twice
  validates_uniqueness_of :course_id, scope: :user_id #user can't be suscribed to the same course twice

  validate :cant_suscribe_to_own_course #user can't create suscribtion if course.user == current_user.id

  scope :pending_review, -> { where(rating: [0, nil, ""], review: [0, nil, ""]) }
  scope :reviewed, -> { where.not(review: [0, nil, ""]) }

  extend FriendlyId
  friendly_id :to_s, use: :slugged

  def to_s
    user.to_s + " " + course.to_s
  end
  
    after_save do
        unless rating.nil? || rating.zero?
          course.update_rating
        end
    end

    after_destroy do
        course.update_rating
    end

    after_create :calculate_balance
    after_destroy :calculate_balance

    def calculate_balance
      course.calculate_income
      user.calculate_enrollment_expenses
    end

  protected
    def cant_suscribe_to_own_course
        if self.new_record?
            if self.user_id.present?
                if user_id == course.user_id
                    errors.add(:base, "You can't suscribe to your own course")
                end
            end
        end
    end

end
