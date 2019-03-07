require_relative './version'

class TopFilms::Scraper

  def self.get_first_50
    page1 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating"))
    # @title = page1.css("h3.lister-item-header a").first.text
    # @rating = page1.css("div.ratings-imdb-rating strong").first.text
    # @year = page1.css("h3.lister-item-header span.lister-item-year").first.text
    # @description = page1.css("div.lister-item-content p.text-muted")[1].text.strip
    # @genre = page1.css("span.genre").first.text.split.join
    # @advisory = page1.css("p.text-muted span.certificate").first.text
  end

  def self.scrape_film_index1
    index1 = get_first_50.css("span.text-primary").text.split(".").collect { |i| i.to_i}
  end

  def self.get_first_50_titles
    scrape_film_index1.collect do |i|
      get_first_50.css("h3.lister-item-header a")[i - 1].text
    end
  end

  def self.get_first_50_ratings
    scrape_film_index1.collect do |i|
      get_first_50.css("div.ratings-imdb-rating strong")[i - 1].text
    end
  end

  def self.get_first_50_years
    scrape_film_index1.collect do |i|
      get_first_50.css("h3.lister-item-header span.lister-item-year")[i - 1].text
    end
  end

  def self.get_first_50_descriptions
    descriptions = (1..100).to_a.collect do |i|
      if i.odd?
        get_first_50.css("div.lister-item-content p.text-muted")[i].text.strip
      end
    end
    descriptions.compact
  end

  def self.get_first_50_genres
    scrape_film_index1.collect do |i|
      get_first_50.css("span.genre")[i - 1].text.split.join
    end
  end

  def self.get_first_50_advisories
    scrape_film_index1.collect do |i|
      get_first_50.css("p.text-muted span.certificate")[i - 1].text
    end
  end





  def get_second_50
    page2 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating,desc&start=51&ref_=adv_nxt"))
    # title = page2.css("h3.lister-item-header a").first.text
    # rating = page2.css("div.ratings-imdb-rating strong").first.text
    # year = page2.css("h3.lister-item-header span.lister-item-year").first.text
    # description = page2.css("div.lister-item-content p.text-muted")[1].text.strip
    # genre = page2.css("span.genre").first.text.split.join
    # advisory = page2.css("p.text-muted span.certificate").first.text
    # binding.pry
  end

  def scrape_film_index2
    index2 = @page2.css("span.text-primary").text.split(".").collect { |i| i.to_i}
  end

  def make_first_films
    scrape_film_index1.each do |f|
      TopFilms::Film.new(get_first_50)
      binding.pry
    end
  end

end
