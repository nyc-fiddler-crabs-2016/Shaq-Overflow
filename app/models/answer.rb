class Answer < ActiveRecord::Base

has_many :comments, as: :commentable, dependent: :destroy
has_many :votes, as: :votable, dependent: :destroy

belongs_to :user
belongs_to :question

validates :content, :user_id, :question_id, presence: true


  def score
    self.votes.pluck(:value).reduce(:+)
  end


end
