class Course < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: { :minimum => 5 }

    belongs_to :user
    has_many :lessons, dependent: :destroy
    has_many :enrollments

    def to_s
        title
    end
    has_rich_text :description

    extend FriendlyId
    friendly_id :title, use: :slugged

    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
end
