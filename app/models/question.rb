class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :user
  has_and_belongs_to_many :tags


  def score
    self.votes.pluck(:value).reduce(:+)
  end

  def top_vote_day

  end

  def top_vote_week
  end

  def top_vote_month
  end

end
