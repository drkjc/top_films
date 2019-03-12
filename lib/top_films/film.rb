require_relative './version'

class TopFilms::Film

  attr_accessor :title, :rating, :year, :advisory, :genre, :director, :lead_actors, :run_time, :votes, :description

  @@all = []
  # @@first_50 = []
  # @@second_50 = []

  def initialize(title = nil, rating = nil, year = nil, advisory = nil, genre = nil, director = nil, lead_actors = nil, run_time = nil, votes = nil, description = nil)
    @title = title
    @rating = rating
    @year = year
    @advisory = advisory
    @genre = genre
    @director = director
    @lead_actors = lead_actors
    @run_time = run_time
    @votes = votes
    @description = description
    # @@all << self
  end

  def self.all
    @@all
  end

  def add_film
    @@all << self
  end

end
