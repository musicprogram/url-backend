class User < ApplicationRecord
  has_secure_password

  has_many :links

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, presence: true, allow_blank: false

  def to_token_payload
    {
      sub: id,
      email: email,
      name: name
    }
  end

end
