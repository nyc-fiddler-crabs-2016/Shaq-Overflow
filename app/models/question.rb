class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :user
  has_and_belongs_to_many :tags


  def score
    self.votes.pluck(:value).reduce(:+) || 0
  end

  # def top_vote_day
  #   Question.all.where(((Time.now - Question.first.created_at) / 3600) == 24) order
  # end

  # def top_vote_week

  # end

  # def top_vote_month
  # end

end
