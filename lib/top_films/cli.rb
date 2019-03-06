require_relative './version'
require_relative './film'

class TopFilms::CLI

  def call
    list_rankings
    menu
    goodbye
  end

  def list_rankings
    puts "For films 1-25 type 1. 26-50 type 2. 51-75 type 3. 76-100 type 4."
  end

  def menu
    input = nil
    until input == "exit"
      puts <<~DOC
        To see the rankings type 'rankings'.
        To leave type 'exit'
      DOC
      input = gets.strip.downcase
      case input
      when "1"
        TopFilms::Film.all[0..25].each.with_index(1) do |film, i|
          puts "#{i}. #{film.title}"
        end
      when "2"
        TopFilms::Film.all[25..50].each.with_index(26) do |film, i|
          puts "#{i}. #{film.title}"
        end
      when "3"
        TopFilms::Film.all[50..75].each.with_index(51) do |film, i|
          puts "#{i}. #{film.title}"
        end
      when "4"
        TopFilms::Film.all[75..100].each.with_index(76) do |film, i|
          puts "#{i}. #{film.title}"
        end
      when "rankings"
        list_rankings
      else
        puts "Not sure what you want."
      end
    end
  end

  def goodbye
    puts "Goodbye!"
  end


end
