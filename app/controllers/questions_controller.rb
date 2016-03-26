class QuestionsController < ApplicationController

  def index
    @questions = Question.last(10)
    # @hot_questions = Question.top_vote_day
    # @week_questions = Question.top_vote_week
    # @month_questions = Question.top_vote_month
    #TODO build question selection methods in question model
  end



  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
    @score = @question.score
    @question_comments = @question.comments
    @comment = Comment.new
    @vote = Vote.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
      if @question.save
        redirect_to "/questions/#{@question.id}"
      else
        render '/questions/new'
      end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to "/questions/#{@question.id}"
    else
      render "/questions/#{@question.id}/edit"
    end
  end

  def destroy
    question = Question.find(params[:id])
     if question.destroy
      redirect_to "/"
    else
      "something bad happened"
    end
  end
private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
