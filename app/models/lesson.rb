class Lesson < ApplicationRecord

  validates :title, :content, :course, presence: true
  belongs_to :course, counter_cache: true
  #Course.find_each { |course| Course.reset_counters(courses.id, :lessons) }
  has_many :user_lessons, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content

  include RankedModel
  ranks :row_order, :with_same => :course_id

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  validates :title, :content, :course, presence: true

  def next
    course.lessons.where('row_order > ?', row_order).order(:row_order).first
  end

  def prev
    course.lessons.where('row_order < ?', row_order).order(:row_order).last
  end
  
  def to_s
    title
  end

  def viewed(user)
    self.user_lessons.where(user_id: [user.id], lesson_id: [self.id]).present?
  end

end
