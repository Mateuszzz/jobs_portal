class Category < ActiveRecord::Base
  has_many :jobs
  
  validates :name, presence: true, length: {minimum: 2, maximum: 75}
end
