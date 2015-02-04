class LessonController < ApplicationController

  def index
    @lessons = Lesson.all
  end


end
