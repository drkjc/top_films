require_relative './version'

class TopFilms::Film

  attr_accessor :title, :rating, :year, :description, :advisory, :genre

  @@all = []

  def initialize(title = nil, rating = nil, year = nil, description = nil, advisory = nil, genre = nil)
    @title = title
    @rating = rating
    @year = year
    @description = description
    @advisory = advisory
    @genre = genre
    @@all << self
  end

  # def make_frst_50
  #   get_page1.each.with_index do |data, i|
  #     film = TopFilms::Film.new
  #     film.title = @page1.css("div.lister-item h3.lister-item-header a")[i].text
  #     film.rating = @page1.css("div.ratings-imdb-rating strong")[i].text
  #     film.year = @page1.css("h3.lister-item-header span.lister-item-year")[i].text
  #     film.genre = @page1.css("span.genre")[i].text.split.join
  #     film.advisory = @page1.css("p.text-muted span.certificate")[i].text
  #     film.description = @page1.css("div.lister-item-content p.text-muted:nth-child(4)")[i].text.strip
  #   end
  # end

  def self.all
    @@all
  end

end
