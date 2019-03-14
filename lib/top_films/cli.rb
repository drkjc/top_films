require_relative './version'
require_relative './film'
require_relative './scraper'

puts
puts "Welcome to TopFilms! Please hold while I gather your film list."
puts

class TopFilms::CLI

  attr_accessor :list_letter, :film, :rank_num

  TopFilms::Scraper.new.make_films

  puts "These are the top 100 films of all time.".light_yellow
  sleep(2)
  puts "The films have been divided into five lists.".light_magenta
  sleep(2)
  puts "They are ranked according to IMDB user rating.".light_yellow
  sleep(3)

  def call
    puts
    start
    interact
  end

  def start
    lineWidth = 80
    puts ("Enter a letter to see the corresponding list.".center(lineWidth)).colorize(:color => :red, :background => :light_white)
    puts <<~DOC

    'A' for films (1-20)
    'B' for films (21-40)
    'C' for films (41-60)
    'D' for films (61-80)
    'E' for films (81-100)
    'X' for a surprise film!
    DOC
    @list_letter = gets.strip.downcase
  end

  def interact
    lineWidth = 40

    puts
    film_list(list_letter)

    puts ("Enter rank number to explore the film.".center(lineWidth)).colorize(:color => :red, :background => :light_white)
    puts ("or".center(lineWidth)).light_yellow
    puts ("'E' to exit.".center(lineWidth)).colorize(:color => :red, :background => :light_white)

    @rank_num = gets.strip.downcase

    num_works?(rank_num)

    film_description(film)
    puts

    menu_bar

  end

  def film_list(list_letter)
    case list_letter
    when 'a'
      TopFilms::Film.all[0..19].each.with_index(1) do |film, i|
        puts "#{i} #{film.title}"
      end
    when 'b'
      TopFilms::Film.all[20..39].each.with_index(21) do |film, i|
        puts "#{i} #{film.title}"
      end
    when 'c'
      TopFilms::Film.all[40..59].each.with_index(41) do |film, i|
        puts "#{i} #{film.title}"
      end
    when 'd'
      TopFilms::Film.all[60..79].each.with_index(61) do |film, i|
        puts "#{i} #{film.title}"
      end
    when 'e'
      TopFilms::Film.all[80..99].each.with_index(81) do |film, i|
        puts "#{i} #{film.title}"
      end
    when 'x'
      film = TopFilms::Film.all.sample
      @rank_num = TopFilms::Film.all.find_index(film) + 1
      film_description(film)
      menu_bar
    else
      puts "Invalid Selection".red
      puts
      call
    end
  end

  def get_film(rank_num)
    TopFilms::Film.all[rank_num.to_i - 1]
  end

  def film_description(film)
    lineWidth = 80
    puts
    puts ("~*~*~*~*~  #{rank_num}. #{film.title} #{film.year}  ~*~*~*~*~".center(lineWidth)).light_yellow
    puts
    puts ("#{film.advisory} | #{film.run_time} | #{film.genre}".center(lineWidth))
    puts
    puts ("#{film.rating}/10 based on #{film.votes} votes.".center(lineWidth))
    puts
    puts ("____________Description:____________".center(lineWidth)).light_yellow
    puts ("#{film.description}".center(lineWidth))
    puts ("------------------------------------".center(lineWidth)).light_yellow
    puts ("Director: #{film.director}".center(lineWidth))
    puts
    puts ("Stars: #{film.lead_actors}".center(lineWidth))
    puts ("*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*".center(lineWidth)).light_yellow
    puts
  end

  def menu_bar
    lineWidth = 40
    puts ("enter 'L' to see the list/random film".ljust(lineWidth)).colorize(:color => :red, :background => :light_white)
    puts
    puts ("enter 'R' to see the rankings".ljust(lineWidth)).colorize(:color => :red, :background => :light_white)
    puts
    puts ("enter 'E' to exit".ljust(lineWidth)).colorize(:color => :red, :background => :light_white)
    input = gets.strip.downcase
    puts

    if input == "l"
      interact
    elsif input == "r"
      call
    elsif input == "e"
      puts "See you next time!".light_yellow
      puts
      exit
    else
      puts "Please try again.".red
      puts
      menu_bar
    end
  end

  def num_works?(rank_num)
    if @rank_num == 'e'
      exit
    elsif (1..100).to_a.include?(rank_num.to_i) == false
      @rank_num = " "
      puts "Invalid Selection".red
      interact
    else
      @film = get_film(rank_num)
    end
  end

end
