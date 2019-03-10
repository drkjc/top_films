require_relative './version'

class TopFilms::Scraper

  attr_accessor :page1, :page2

  # def initialize
  #   get_page1
  #   make_frst_50
  # end

  def get_page1
    @page1 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating")).css("div.lister-item.mode-advanced")
  end

  def make_frst_50
    get_page1.each.with_index do |data, i|
      film = TopFilms::Film.new
      film.title = @page1.css("div.lister-item h3.lister-item-header a")[i].text
      film.rating = @page1.css("div.ratings-imdb-rating strong")[i].text
      film.year = @page1.css("h3.lister-item-header span.lister-item-year")[i].text
      film.genre = @page1.css("span.genre")[i].text.split.join
      film.advisory = @page1.css("p.text-muted span.certificate")[i].text
      film.description = @page1.css("div.lister-item-content p.text-muted:nth-child(4)")[i].text.strip
    end
    TopFilms::Film.all
  end



  # def self.get_page2
  #   @page2 = Nokogiri::HTML(open("https://www.imdb.com/search/title?groups=top_250&sort=user_rating,desc&start=51&ref_=adv_nxt"))
  # end
  #
  # def self.index2
  #   #@page2.css("span.text-primary").text.split(".").collect { |i| i.to_i}
  #   @page2.css("div.lister-item.mode-advanced")
  # end
  #
  # def self.make_scnd_50
  #   index2.each.with_index do |data, i|
  #     film = TopFilms::Film.new
  #     film.title = @page2.css("div.lister-item h3.lister-item-header a")[i].text#@page.css("h3.lister-item-header a").first.text
  #     film.rating = @page2.css("div.ratings-imdb-rating strong")[i].text
  #     film.year = @page2.css("h3.lister-item-header span.lister-item-year")[i].text
  #     film.genre = @page2.css("span.genre")[i].text.split.join
  #     binding.pry
  #     film.advisory = @page2.css("p.text-muted span.certificate")[i].text
  #     film.description = @page2.css("div.lister-item-content p.text-muted:nth-child(4)")[i].text.strip #film.description = @page.css("div.lister-item-content p.text-muted")[i].text.strip
  #   end
  # end

end
