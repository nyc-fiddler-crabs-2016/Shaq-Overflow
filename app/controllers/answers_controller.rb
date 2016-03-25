class AnswersController < ActionController::Base

  def new
    @question = Question.find(params[:id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:id])
    @answer = @question.answers.build(params[:answer])
    @answer.user_id = session[:user_id]
    if @answer.save
      redirect_to "/questions/#{@answer.question.id}"
    else
      flash[:alert] = @answer.errors.full_messages
      render 'new'
  end

  def edit
    @answer = Answer.find(params[:id])

  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(answer_params)
      redirect_to "/questions/#{@answer.question.id}"
    else
      flash[:alert] = @answer.errors.full_messages
      render 'edit'
  end

  def destroy
    @answer = Answer.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to root_path
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end


end
