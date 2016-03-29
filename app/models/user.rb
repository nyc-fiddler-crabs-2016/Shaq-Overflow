class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  def reputation
    question_rep = self.questions.map { |q| q.score }.inject(:+)
    answer_rep = self.answers.map { |a| a.score }.inject(:+)
    comment_rep = self.comments.map {|c| c.score }.inject(:+)
    question_rep + answer_rep + comment_rep
  end

  def owns?(submission_type, submission_id)
    case submission_type
    when 'question'
      self.questions.include?(Question.find(submission_id))
    when 'answer'
      self.answers.include?(Answer.find(submission_id))
    when 'comment'
      self.comments.include?(Comment.find(submission_id))
    end
  end

  def hasnt_voted?(type, id)
    self.votes.where(votable_type: type, votable_id: id).empty?
  end

end
