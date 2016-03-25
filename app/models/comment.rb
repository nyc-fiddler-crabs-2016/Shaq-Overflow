class Comment < ActiveRecord::Base

has_many :votes, as: :votable
belongs_to :commentable, polymorphic: true
belongs_to :user

end
