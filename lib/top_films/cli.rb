require_relative './version'
require_relative './film'
require_relative './scraper'

puts "Welcome! Gathering your film list."
puts

class TopFilms::CLI

  #colorize gem

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
    Which films would you like to see?
    Type the letter for the corresponding list.

      A. 1-25
      B. 26-50
      C. 51-75
      D. 76-100

    DOC
    @list_letter = gets.strip.downcase
  end

  def interact
    puts

    film_list(list_letter)
    puts

    puts "Films are in ranked order. Type rank number to explore the film."
    puts

    @rank_num = gets.strip.downcase

    @film = get_film(rank_num)

    film_description(film)
    puts

    puts "To see another film type 'list'. Rankings type 'rank'. Exit type 'exit'."
    input = gets.strip.downcase
    puts

    if input == "list"
      interact
    elsif input == "rank"
      call
    elsif input == "exit"
      puts "See you next time!"
      exit
    else
      puts "Please try again."
      call
    end

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
    else
      puts "Please type a letter."
    end
  end

  def get_film(rank_num)
    TopFilms::Film.all[rank_num.to_i - 1]
  end

  def film_description(film)
    lineWidth = 75
    puts ("~*~*~*~*~*~*~  #{film.title}#{film.year}  ~*~*~*~*~*~*~".center(lineWidth)).blue.on_light_yellow
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
    puts ("*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*".center(lineWidth)).blue.on_light_yellow
  end

end
