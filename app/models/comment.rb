class Comment < ActiveRecord::Base

has_many :votes, as: :votable
belongs_to :commentable, polymorphic: true
belongs_to :user


  def score
    self.votes.pluck(:value).reduce(:+)
  end


end
