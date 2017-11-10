class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :creator, class_name: :User
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :body, presence: true

end
