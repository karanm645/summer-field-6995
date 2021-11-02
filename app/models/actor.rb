class Actor < ApplicationRecord 
  has_many :actor_movie
  has_many :movies, through: :actor_movie
  
  validates_presence_of :name, :age 
end 