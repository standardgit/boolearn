class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @course = Course.friendly.find(params[:course_id])
        @lesson = Lesson.friendly.find(params[:lesson_id])
        @comment.lesson_id = @lesson.id
        @comment.user = current_user

        # if @Comment.save
        #     redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully created.'
        # else
        #     render :new
        # end

        respond_to do |format|
            if @comments.save
              format.html { redirect_to course_lesson_path(@course, @lesson), notice: "Lesson was successfully created." }
              format.json { render :show, status: :created, location: @lesson }
            else
              format.html { render "lessons/comments/new" }
              format.json { render json: @lesson.errors, status: :unprocessable_entity }
            end
          end
    end

    def destroy
      @course = Course.friendly.find(params[:course_id])
      @lesson = Lesson.friendly.find(params[:lesson_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
      authorize @comment
      respond_to do |format|
        format.html { redirect_to course_lesson_path(@course, @lesson), notice: "Lesson was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
end