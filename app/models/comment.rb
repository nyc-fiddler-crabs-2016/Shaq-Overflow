class Comment < ActiveRecord::Base

has_many :votes, as: :votable , dependent: :destroy
belongs_to :commentable, polymorphic: true
belongs_to :user


  def score
    self.votes.pluck(:value).reduce(:+) || 0
  end


end
