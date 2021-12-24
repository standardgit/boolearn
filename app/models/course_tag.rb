class Tag < ApplicationRecord

    belongs_to :course
    belongs_to :tag, counter_cache: true

end