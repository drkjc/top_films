require_relative './version'

class TopFilms::Scraper

  attr_accessor :page

  def initialize
  end

  # def self.start
  #   self.get_first_50
  #   self.make_films
  #   self.add_descriptions
  # end

  def self.index5
    index5 = get_first_50.css("div.article div.lister-item")
  end

  def self.index1
    # fifty_arr = (1..50).to_a
    index1 = get_first_50.css("span.text-primary").text.split(".").collect { |i| i.to_i}
  end

  def self.get_first_50
    @page = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating"))
  end

  def self.make_films
    index1.each do |i|
      film = TopFilms::Film.new
      film.title = @page.css("div.lister-item h3.lister-item-header a")[i - 1].text#@page.css("h3.lister-item-header a").first.text
      film.rating = @page.css("div.ratings-imdb-rating strong")[i - 1].text
      film.year = @page.css("h3.lister-item-header span.lister-item-year")[i - 1].text
      film.genre = @page.css("span.genre")[i - 1].text.split.join
      film.advisory = @page.css("p.text-muted span.certificate")[i - 1].text
      film.description = @page.css("div.lister-item-content p.text-muted:nth-child(4)")[i - 1].text.strip #film.description = @page.css("div.lister-item-content p.text-muted")[i].text.strip
    end
    TopFilms::Film.all
  end

  def self.add_descriptions
    i = 0
    TopFilms::Film.all.collect do |film|
      film.description = @descriptions[i]
      i += 1
    end
  end

  def self.get_second_50
    Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating,desc&start=51&ref_=adv_nxt"))
  end

  ########################### First 50 Films ###########################

  #Returns an array of titles
  def self.get_first_50_titles
    index1.collect do |i|
      get_first_50.css("h3.lister-item-header a")[i - 1].text
    end
  end

  #Returns an array of ratings
  def self.get_first_50_ratings
    fifty_arr.collect do |i|
      get_first_50.css("div.ratings-imdb-rating strong")[i - 1].text
    end
  end

  #Returns an array of years
  def self.get_first_50_years
    fifty_arr.collect do |i|
      get_first_50.css("h3.lister-item-header span.lister-item-year")[i - 1].text
    end
  end

  #Returns an array of descriptions
  def self.get_first_50_descriptions
    @descriptions = (1..100).to_a.collect do |i|
      if i.odd?
        get_first_50.css("div.lister-item-content p.text-muted")[i].text.strip
      end
    end
    @descriptions
  end

  #Returns an array of genres
  def self.get_first_50_genres
    fifty_arr.collect do |i|
      get_first_50.css("span.genre")[i - 1].text.split.join
    end
  end

  #Returns an array of advisories
  def self.get_first_50_advisories
    fifty_arr.collect do |i|
      get_first_50.css("p.text-muted span.certificate")[i - 1].text
    end
  end

  def self.set_titles
    get_first_50_titles.each { |t| TopFilms::Film.new.title = t}
    i = 0
    TopFilms::Film.all.each do |f|
      f.rating = get_first_50_ratings[0]
      i += 1
    end
  end

  def self.scrape_all
    r = get_first_50_ratings
    y = get_first_50_years
    d = get_first_50_descriptions
    a = get_first_50_advisories
    g = get_first_50_genres
    get_first_50_titles.each { |t| TopFilms::Film.new.title = t }
    TopFilms::Film.all.each { |f| f.rating = r }
  end

  def self.make_film
    film = TopFilms::Film.new
    film.title = get_first_50_titles[0]
    film.rating = get_first_50_ratings[0]
    film.year = get_first_50_years[0]
    film.description = get_first_50_descriptions[0]
    film.advisory = get_first_50_advisories[0]
    film.genre = get_first_50_genres[0]
    film
    binding.pry
  end


  ########################### Second 50 Films ###########################

  #Returns an array of titles
  def self.get_second_50_titles
    fifty_arr.collect do |i|
      get_second_50.css("h3.lister-item-header a")[i - 1].text
    end
  end

  #Returns an array of ratings
  def self.get_second_50_ratings
    fifty_arr.collect do |i|
      get_second_50.css("div.ratings-imdb-rating strong")[i - 1].text
    end
  end

  #Returns an array of years
  def self.get_second_50_years
    fifty_arr.collect do |i|
      get_second_50.css("h3.lister-item-header span.lister-item-year")[i - 1].text
    end
  end

  #Returns an array of descriptions
  def self.get_second_50_descriptions
    descriptions = (1..100).to_a.collect do |i|
      if i.odd?
        get_second_50.css("div.lister-item-content p.text-muted")[i].text.strip
      end
    end
    descriptions.compact
  end

  #Returns an array of genres
  def self.get_second_50_genres
    fifty_arr.collect do |i|
      get_second_50.css("span.genre")[i - 1].text.split.join
    end
  end

  #Returns an array of advisories
  def self.get_second_50_advisories
    fifty_arr.collect do |i|
      get_second_50.css("p.text-muted span.certificate")[i - 1].text
    end
  end

end
