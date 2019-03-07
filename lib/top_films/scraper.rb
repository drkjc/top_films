require_relative './version'

class TopFilms::Scraper

  def get_first_50
    #title = nil, rating = nil, year = nil, description = nil, genre, rating
    page1 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating"))
    # @title = page1.css("h3.lister-item-header a").first.text
    # @rating = page1.css("div.ratings-imdb-rating strong").first.text
    # @year = page1.css("h3.lister-item-header span.lister-item-year").first.text
    # @description = page1.css("div.lister-item-content p.text-muted")[1].text.strip
    # @genre = page1.css("span.genre").first.text.split.join
    # @advisory = page1.css("p.text-muted span.certificate").first.text
  end

  def get_second_50
    page2 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating,desc&start=51&ref_=adv_nxt"))
    title = page2.css("h3.lister-item-header a").first.text
    rating = page2.css("div.ratings-imdb-rating strong").first.text
    year = page2.css("h3.lister-item-header span.lister-item-year").first.text
    description = page2.css("div.lister-item-content p.text-muted")[1].text.strip
    genre = page2.css("span.genre").first.text.split.join
    advisory = page2.css("p.text-muted span.certificate").first.text
    binding.pry
  end

  def scrape_film_index
    index1 = page1.css("span.text-primary").text.split(".").collect { |i| i.to_i}
    index2 = page2.css("span.text-primary").text.split(".").collect { |i| i.to_i}
    self.get_page
  end

  def make_films
    TopFilms::Film.new(get_page)
  end

end
