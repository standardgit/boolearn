class Tag < ApplicationRecord

    has_many :course_tags
    has_many :courses, through: :course_tags

    
  validates_uniqueness_of :name, length: {minimum: 1, maximum: 25}

end