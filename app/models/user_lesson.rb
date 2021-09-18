class UserLesson < ApplicationRecord
    belongs_to :user
    belongs_to :lesson

    validates :user, :lesson, presence: true

    validates_uniqueness_of :user_id, scope: :lesson_id #user can't be suscribed to the same course twice
    validates_uniqueness_of :lesson_id, scope: :user_id #user can't be suscribed to the same course twice
end