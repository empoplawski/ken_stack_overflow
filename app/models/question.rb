class Question < ApplicationRecord
  has_many :answers
  has_many :comments, as: :commentable
  belongs_to :asker, class_name: :User
  has_many :votes, as: :votable

  validates :title, :description, presence: true
  validates :asker, presence: true

  def total_votes
    self.votes.reduce(0) do |total, vote|
      total + vote.value
    end
  end

  def question_owner?(user)
    user.id == self.asker_id
  end

  def has_best_answer?(user)
    self.question_owner?(user) && self.best_answer_id == nil
  end

end
