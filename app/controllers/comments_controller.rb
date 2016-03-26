class CommentsController < ApplicationController

  def create
    case params[:comment_type]
    when "Question"
      comment_target = Question.find(params[:question_id])
    when "Answer"
      comment_target = Answer.find(params[:answer_id])
    end
    @comment = comment_target.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
    end

  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to :back
    else
      "???"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
