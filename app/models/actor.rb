class Actor < ApplicationRecord 
  has_many :movies
  validates_presence_of :name, :age 
end 