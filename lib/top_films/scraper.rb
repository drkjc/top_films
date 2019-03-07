require_relative './version'

class TopFilms::Scraper

  def self.fifty_arr
    fifty_arr = (1..50).to_a
    # index1 = get_first_50.css("span.text-primary").text.split(".").collect { |i| i.to_i}
  end

  def self.get_first_50
    page1 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating"))
  end

  def self.get_second_50
    page2 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating,desc&start=51&ref_=adv_nxt"))
  end

  ########################### First 50 Films ###########################

  #Returns an array of titles
  def self.get_first_50_titles
    fifty_arr.collect do |i|
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
    descriptions = (1..100).to_a.collect do |i|
      if i.odd?
        get_first_50.css("div.lister-item-content p.text-muted")[i].text.strip
      end
    end
    descriptions.compact
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

  def make_first_films
    scrape_film_index1.each do |f|
      TopFilms::Film.new(get_first_50)
      binding.pry
    end
  end

end
