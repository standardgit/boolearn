class Lesson < ApplicationRecord

  validates :title, :content, :course, presence: true
  validates :title, uniqueness: true, length: { :maximum => 70 }
  validates :video,
    content_type: [ 'video/mp4' ], 
    size: { less_than: 50.megabytes , message: 'video size should be under 50 megabytes' }

  validates :video_thumbnail,
    content_type: ['image/png', 'image/jpg', 'image/jpeg'], 
    size: { less_than: 500.kilobytes , message: 'video size should be under 500 kilobytes' }

  # validates :video_thumbnail, presence: true, if: :video_present?
  # def video_present?
  #   self.video.present?
  # end

  belongs_to :course, counter_cache: true
  #Course.find_each { |course| Course.reset_counters(courses.id, :lessons) }
  has_many :user_lessons, dependent: :destroy
  has_many :comments, dependent: :nullify

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content
  has_one_attached :video
  has_one_attached :video_thumbnail

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
    self.user_lessons.where(user: user).present?
    #self.user_lessons.where(user_id: [user.id], lesson_id: [self.id]).empty?
  end

end
