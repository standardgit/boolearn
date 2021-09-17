class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def landing_page
    @courses = Course.all.limit(3)
    @latest_courses = Course.all.latest
    @enrollments = Enrollment.reviewed.all.order(rating: :desc, created_at: :desc).limit(3)

    @top_rated_courses = Course.top_rated
    @popular_courses = Course.popular
    @purchased_courses = Course.joins(:enrollments).where(enrollments: {user: current_user}).order(created_at: :desc).limit(3)
  end

  def privacy_policy
  end

  def activity
    @activities = PublicActivity::Activity.all
  end
end
