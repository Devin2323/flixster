class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_for_current_course, only: [:show]

  def show
  end

  def require_enrollment_for_current_course
    #logger.debug "Lesson: #{current_lesson.inspect}"

    if !current_user.enrolled_in?(current_lesson.section.course) && current_lesson.section.course.user != current_user
      redirect_to courses_url, alert: 'You are not enrolled'
    end
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
