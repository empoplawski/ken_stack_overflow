class User < ApplicationRecord
   include BCrypt

  has_many :questions, foreign_key: :asker_id
  has_many :answers, foreign_key: :creator_id
  has_many :votes, foreign_key: :voter_id
  has_many :comments, foreign_key: :commenter_id

  validates :username, :email, presence: true
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  validate :validate_password


 def password
    @password ||= Password.new(hashed_password)
  end

 def password=(plain_text_password)
    @raw_password = plain_text_password
    @password = Password.create(plain_text_password)
    self.hashed_password = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

  def validate_password
    if @raw_password.length == 0
      errors.add(:password, "is required")
    elsif
      @raw_password.length < 6
      errors.add(:password, "must be at least 6 characters")
    end
  end


end
