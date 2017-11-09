class Comment < ApplicationRecord
  belongs_to :commenter, class_name: :User
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  validates :content, presence: true
end
