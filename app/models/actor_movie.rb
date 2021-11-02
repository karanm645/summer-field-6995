class ActorMovie < ApplicationRecord
  belongs_to :movie 
  belongs_to :actor 
  # has_many :actor_movie
end 