require_relative './version'

class TopFilms::Film

  attr_accessor :title, :rating, :year, :advisory, :genre, :director, :lead_actors, :run_time, :votes, :description

  @@all = []

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
    @@all << self
  end

  def self.all
    @@all
  end

  #return a list of films in alphabetical order by title
  def self.return_title
    alph_array = TopFilms::Film.all.sort_by do |film|
      film.title
    end
  end

end
