require_relative './version'

class TopFilms::Scraper

  def get_pages
    pages = []
    pages << page1 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating")).css("div.lister-item.mode-advanced")
    pages << page2 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating,desc&start=51&ref_=adv_nxt")).css("div.lister-item.mode-advanced")
    pages
  end

  def make_films
    get_pages.each do |page|
      page.each.with_index do |data, i|
        film = TopFilms::Film.new
        film.title = page.css("div.lister-item h3.lister-item-header a")[i].text
        film.rating = page.css("div.ratings-imdb-rating strong")[i].text
        film.year = page.css("h3.lister-item-header span.lister-item-year")[i].text
        page.css("div.lister-item-content p.text-muted:nth-child(n+1):nth-child(-n+2)")[i].text.split("\n").join.strip.split.shift.split("").length == 3 ? film.advisory = "n/a" : film.advisory = page.css("div.lister-item-content p.text-muted:nth-child(n+1):nth-child(-n+2)")[i].text.split("\n").join.strip.split.shift
        film.genre = page.css("span.genre")[i].text.split.join
        film.director = page.css("div.lister-item-content p:nth-child(5) a:first-child")[i].text
        film.lead_actors = page.css("div.lister-item-content p:nth-child(5)")[i].text.split("\n").drop(5).join.strip.gsub("Stars:", "")
        film.run_time = page.css("span.runtime")[i].text
        film.votes = page.css("p.sort-num_votes-visible span:nth-child(2)")[i].text
        film.description = page.css("div.lister-item-content p.text-muted:nth-child(4)")[i].text.strip
      end
    end
    TopFilms::Film.all
  end

end
