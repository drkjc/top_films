require_relative './version'
require_relative './film'
require_relative './scraper'

class TopFilms::CLI

  puts "Welcome! Gathering your film list."
  puts

  def call
    TopFilms::Scraper.new.make_frst_50
    puts "These are the top 50 films of all time based on user rating."
    puts ""
    start
  end

  def start

    puts <<~DOC
    Which films would you like to see?
    Type the letter for the corresponding list.

      A. 1-25
      B. 26-50
    DOC

    input = gets.strip.downcase
    puts
    film_list(input)
    puts
    puts "Select a film to see the description. Type the ranking number."
    puts
    input = gets.strip.downcase
    puts
    film_description(input)
    puts
    puts "Would you like to see another film? Enter Y or N"
    input = gets.strip.downcase
    puts
    if input == "y"
      start
    elsif input == "n"
      puts "See you next time!"
      exit
    else
      puts "Please try again."
      start
    end

  end

  def film_list(input)
    if input == "a"
      TopFilms::Film.all[0..24].each.with_index(1) do |film, i|
        puts "#{i}. #{film.title} #{film.rating}/10"
      end
    elsif input == "b"
      TopFilms::Film.all[25..49].each.with_index(26) do |film, i|
        puts "#{i}. #{film.title} #{film.rating}/10"
      end
    elsif input == "c"
      TopFilms::Film.all[50..74].each.with_index(51) do |film, i|
        puts "#{i}. #{film.title} #{film.year} #{film.rating}/10"
      end
    elsif input == "d"
      TopFilms::Film.all[75..99].each.with_index(76) do |film, i|
        puts "#{i}. #{film.title} #{film.year} #{film.rating}/10"
      end
    else
      puts "Please type a range to view films or type exit."
      list_rankings
    end
  end

  def film_description(input)
    puts "------------#{TopFilms::Film.all[input.to_i - 1].title}------------"
    puts
    puts "Year: #{TopFilms::Film.all[input.to_i - 1].year}"
    puts "Rated: #{TopFilms::Film.all[input.to_i - 1].advisory}"
    puts "Genre: #{TopFilms::Film.all[input.to_i - 1].genre}"
    puts
    puts "------------Description:------------"
    puts
    puts "#{TopFilms::Film.all[input.to_i - 1].description}"
    puts
    puts "------------------------------------"
    puts
  end

  # def start
  #   input = ""
  #   while input != "exit"
  #
  #     puts "Which rankings would you like to see? Type the corresponding letter."
  #
  #     list_rankings
  #
  #     input = gets.strip.downcase
  #
  #     if input != "exit"
  #       film_list(input)
  #     else
  #       goodbye
  #       break
  #     end
  #
  #     puts "Select a film to see the description. Type the ranking number."
  #
  #     input = gets.strip.downcase
  #
  #     film_description(input)
  #
  #   end
  # end

  # def list_rankings
  #   puts <<~DOC
  #     A. 1-25
  #     B. 26-50
  #     C. 51-75
  #     D. 76-100
  #   DOC
  # end

  # def goodbye
  #   puts "Goodbye!"
  # end


end
