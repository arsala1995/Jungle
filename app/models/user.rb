class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, confirmation: { case_sensitive: true }
  validates :name, presence: true
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email,password)
    email = email.downcase
    email = email.strip
    User.find_by(email: email).try(:authenticate, password)

  end
end
