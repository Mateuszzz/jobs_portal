class Category < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 2, maximum: 75}
end
