class Course < ApplicationRecord
    extend FriendlyId

    friendly_id :title, use: :slugged
    validates :title, presence: true
    validates :description, presence: true, length: { :minimum => 5 }

    validates :title, uniqueness: true

    scope :latest, -> { limit(3).order(created_at: :desc) }
    scope :top_rated, -> { order(average_rating: :desc, created_at: :desc).limit(3) }
    scope :popular, -> { order(enrollments_count: :desc, created_at: :desc).limit(3) }


    belongs_to :user, counter_cache: true
    #User.find_each { |user| User.reset_counters(user.id, :courses) }
    has_many :lessons, dependent: :destroy
    has_many :enrollments
    has_many :user_lessons, through: :lessons

    def to_s
        title
    end
    has_rich_text :description


    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }

    def bought(user)
        self.enrollments.where(user_id: [user.id], course_id: [self.id]).empty?
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
