class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :user_id, :course_id, presence: true

  validates_uniqueness_of :user_id, scope: :course_id #user can't be suscribed to the same course twice
  validates_uniqueness_of :course_id, scope: :user_id #user can't be suscribed to the same course twice

  validate :cant_suscribe_to_own_course #user can't create suscribtion if course.user == current_user.id

    scope :pending_review, -> { where(rating: [0, nil, ""], review: [0, nil, ""]) }

  def to_s
    user.to_s + " " + course.to_s
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
