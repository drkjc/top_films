require_relative './version'

class TopFilms::Scraper

  def get_page
    #title = nil, rating = nil, year = nil, description = nil
    page = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating"))
    # page = Nokogiri::HTML(open("https://www.imdb.com/chart/top?ref_=nv_mv_250"))
    # title = page.css(".titleColumn a").first.text
    # rating = page.css("td.imdbRating strong").first.text
    # year = page.css("span.secondaryInfo").first.text
    binding.pry
  end

  def get_description
    page = Nokogiri::HTML(open("https://www.imdb.com/chart/top?ref_=nv_mv_250"))
    binding.pry
  end

end
