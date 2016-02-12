class User < ActiveRecord::Base
  before_validation :default_values, on: :create
  
  has_many :jobs
  
  ROLES = %w[user admin]
  
  has_secure_password
  
  validates :first_name, presence: true, length: {minimum: 3, maximum: 40}
  validates :last_name, presence: true, length: {minimum: 3, maximum: 75}
                   
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  validates :password, presence: true, length: { minimum: 6, maximum: 40}, allow_nil: true
    
  def default_values
    if self.role.nil?
       self.role = "user" 
    end    
  end
end
