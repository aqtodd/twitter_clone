class User < ActiveRecord::Base
  
  # callback to standardize email case
  before_save { self.email.downcase! }
  
  validates :name, presence: true, length: { maximum: 64}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password  
  validates :password, length: { minimum: 8 }  

end
