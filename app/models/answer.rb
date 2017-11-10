class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :creator, class_name: :User
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :body, presence: true

  def total_votes
    self.votes.reduce(0) do |total, vote|
      total + vote.value
    end
  end

end
