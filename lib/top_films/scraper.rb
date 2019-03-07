require_relative './version'

class TopFilms::Scraper

  def get_page
    #title = nil, rating = nil, year = nil, description = nil, genre, rating
    page = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating"))
    title = page.css("h3.lister-item-header a").first.text
    rating = page.css("div.ratings-imdb-rating strong").first.text
    year = page.css("h3.lister-item-header span.lister-item-year").first.text
    description = page.css("div.lister-item-content p.text-muted")[1].text.strip
    genre = page.css("span.genre").first.text.split.join
    rating = page.css("p.text-muted span.certificate").first.text
    binding.pry
  end

end
