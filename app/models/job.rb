class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  validates :user_id, :category_id, presence: true
  validates :title, presence: true, length: {minimum: 5, maximum: 75}
  validates :description, presence: true, length: {minimum: 25, maximum: 10000}
  validates :company, presence: true, length: {minimum: 3, maximum: 75}
  validates :location, presence: true, length: {minimum: 3, maximum: 75}
  validates_inclusion_of :active, :in => [true, false]
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX }
end
