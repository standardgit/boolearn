class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @course = Course.friendly.find(param[:course_id])
        @lesson = Lesson.friendly.find(params[:id])
        @comment.lesson_id = @lesson.id

        if @Comment.save
            redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully created.'
        else
            render :new
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
end