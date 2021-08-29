class StaticPagesController < ApplicationController
  
  def landing_page
    skip_before_action :authenticate_user!, :only => [:index]
    @courses = Course.all.limit(3)
    @latest_courses = Course.all.limit(3).order(created_at: :desc)
  end

  def privacy_policy
  end
end
