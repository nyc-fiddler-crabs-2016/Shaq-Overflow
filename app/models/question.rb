class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :user
  has_and_belongs_to_many :tags

end
