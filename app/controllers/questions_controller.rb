class QuestionsController < ActionController::Base

  def index
    @question = Question.last(10)
    @hot_questions = Question.top_vote_day
    @week_questions = Question.top_vote_week
    @month_questions = Question.top_vote_month
    #TODO build question selection methods in question model
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @score = @question.score
    @question_comments = @question.comments
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

  end

  def edit
  end

  def update
  end

  def destroy
  end


end
