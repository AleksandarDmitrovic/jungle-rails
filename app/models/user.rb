class User < ActiveRecord::Base

  has_secure_password
  before_save :downcase
  
  has_many :reviews
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true , uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  def downcase
    self.email = self.email.downcase unless self.email.nil?
  end

end
