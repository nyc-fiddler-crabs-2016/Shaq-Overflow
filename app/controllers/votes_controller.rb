class VotesController < ApplicationController

  def create
    case params[:vote_type]
      when "answer"
        @vote_target = Answer.find(params[:answer_id])
        # if current_user.has_voted?(:vote_type, @vote_target)


      when "comment"
        @vote_target = Comment.find(params[:comment_id])
      when "question"
        @vote_target = Question.find(params[:question_id])
      end
    @vote = @vote_target.votes.build(value: params[:value])
    @vote.user_id = current_user.id
    if @vote.save
      redirect_to :back
    else
      flash.alert = "Woops."
      redirect_to :back
    end

  end



  def update
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      flash.alert = "Try again."
      redirect_to login_path
    end
    @user.update(user_params)
    redirect_to @user
  end

  private

  def vote_params
    params.require(:user).permit(:username, :password, :email)
  end


end
