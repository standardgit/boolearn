class Course < ApplicationRecord
    extend FriendlyId

    friendly_id :title, use: :slugged
    validates :title, presence: true
    validates :description, presence: true, length: { :minimum => 5, :maximum => 3000 }

    validates :title, uniqueness: true, length: { :maximum => 70 }
    validates :price, numericality: { greater_than_or_equal_to: 0 } 

    scope :latest, -> { limit(3).order(created_at: :desc) }
    scope :top_rated, -> { order(average_rating: :desc, created_at: :desc).limit(3) }
    scope :popular, -> { order(enrollments_count: :desc, created_at: :desc).limit(3) }
    scope :published, -> {where(published: true)}
    scope :approved, -> {where(approved: true)}
    scope :unpublished, -> {where(published: false)}
    scope :unapproved, -> {where(approved: false)}


    belongs_to :user, counter_cache: true
    #User.find_each { |user| User.reset_counters(user.id, :courses) }
    has_many :lessons, dependent: :destroy
    has_many :enrollments, dependent: :restrict_with_error
    has_many :user_lessons, through: :lessons
    has_many :course_tags
    has_many :tags, through: :course_tags

    def to_s
        title
    end
    has_rich_text :description
    has_one_attached :avatar

    validates :avatar, presence: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 500.kilobytes , message: 'is not between given size' }
    validates :avatar, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 500.kilobytes , message: 'is not given between size' }

    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }

    def bought(user)
        self.enrollments.where(user_id: [user.id], course_id: [self.id]).empty?
    end
    def calculate_income
        update_column :income, (enrollments.map(&:price).sum)
        user.calculate_balance
    end

    def progress(user)
        unless self.lessons_count == 0
            user_lessons.where(user: user).count/self.lessons_count.to_f*100
        end
    end

    def update_rating
        if enrollments.any? && enrollments.where.not(rating: nil).any?
            update_column :average_rating, (enrollments.average(:rating).round(2).to_f)
        else
            update_column :average_rating, (0)
        end
    end
end
