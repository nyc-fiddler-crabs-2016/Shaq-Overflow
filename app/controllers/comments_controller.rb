class CommentsController < ApplicationController

  def create
    @question = Question.find(params[:id])
    @answer = Answer.find(params[:id])
    @question_comment = Question.
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end



end
