class UserLesson < ApplicationRecord
    belongs_to :user, counter_cache: true
    belongs_to :lesson, counter_cache: true

    validates :user, :lesson, presence: true

    validates_uniqueness_of :user_id, scope: :lesson_id #user can't be suscribed to the same course twice
    validates_uniqueness_of :lesson_id, scope: :user_id #user can't be suscribed to the same course twice
end