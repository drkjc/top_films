require_relative './version'
require_relative './film'
require_relative './scraper'

puts "Welcome! Please hold while I gather your film list."
puts

class TopFilms::CLI

  attr_accessor :list_letter, :film, :rank_num

  TopFilms::Scraper.new.make_films

  def call
    puts "These are the top 100 films of all time based on user rating."
    puts
    start
    interact
  end

  def start
    puts <<~DOC
    Films are in ranked order. 
    Type a letter to see the corresponding list.

    A (1-25)
    B (26-50)
    C (51-75)
    D (76-100)
    X Surprise me!

    DOC
    @list_letter = gets.strip.downcase
  end

  def interact
    puts

    film_list(list_letter)
    puts

    puts "Type rank number to explore the film, or 'exit'."
    puts

    @rank_num = gets.strip.downcase

    num_works?(rank_num)

    film_description(film)
    puts

    menu_bar

  end

  def film_list(list_letter)
    if list_letter == "a"
      TopFilms::Film.all[0..24].each.with_index(1) do |film, i|
        puts "#{i}. #{film.title}"
      end
    elsif list_letter == "b"
      TopFilms::Film.all[25..49].each.with_index(26) do |film, i|
        puts "#{i}. #{film.title}"
      end
    elsif list_letter == "c"
      TopFilms::Film.all[50..74].each.with_index(51) do |film, i|
        puts "#{i}. #{film.title}"
      end
    elsif list_letter == "d"
      TopFilms::Film.all[75..99].each.with_index(76) do |film, i|
        puts "#{i}. #{film.title}"
      end
    elsif list_letter == "x"
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
    puts ("~*~*~*~*~  #{rank_num}. #{film.title} #{film.year}  ~*~*~*~*~".center(lineWidth)).light_yellow
    puts
    puts ("#{film.advisory} | #{film.run_time} | #{film.genre}".center(lineWidth))
    puts
    puts ("#{film.rating}/10 based on #{film.votes} votes.".center(lineWidth))
    puts
    puts ("____________Description:____________".center(lineWidth)).light_yellow
    puts
    puts ("#{film.description}".center(lineWidth))
    puts ("------------------------------------".center(lineWidth)).light_yellow
    puts ("Director: #{film.director}".center(lineWidth))
    puts
    puts ("Stars: #{film.lead_actors}".center(lineWidth))
    puts
    puts ("*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*".center(lineWidth)).light_yellow
    puts
  end

  def menu_bar
    lineWidth = 40
    puts ("enter 'L' to see the list again".ljust(lineWidth)).colorize(:color => :red, :background => :light_white)
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
      exit
    else
      puts "Please try again.".red
      call
    end
  end

  def num_works?(rank_num)
    if @rank_num == 'exit'
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
