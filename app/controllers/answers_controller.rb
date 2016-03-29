class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to "/questions/#{@answer.question.id}"
    else
      flash[:alert] = @answer.errors.full_messages
      render 'new'
  end
end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])

  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(answer_params)
      redirect_to "/questions/#{@answer.question.id}"
    else
      flash[:alert] = @answer.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id]).destroy
    flash[:success] = "Answer Deleted"
    redirect_to :back
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end


end
