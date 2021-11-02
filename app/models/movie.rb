class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movie
  has_many :actors, through: :actor_movie

  validates_presence_of :title, :creation_year, :genre
end
