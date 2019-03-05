require_relative './version'

class TopFilms::CLI

  def call
    list_films
    menu
    goodbye
  end

  def list_films
    puts "For films 1-25 type 1. 26-50 type 2. 51-75 type 3. 76-100 type 4."
  end

  def menu
    input = nil
    until input == "exit"
      puts <<~DOC
        To see the list type 'list'.
        To leave type 'exit'
      DOC
      input = gets.strip.downcase
      case input
      when "1"
        puts <<~DOC
          1. The Shawshank Redemption
          2. The Godfather
          3. The Godfather: Part II
        DOC
      when "2"
        puts <<~DOC
          26. Spirited Away
          27. Saving Private Ryan
          28. The Usual Suspects
        DOC
      when "list"
        list_films
      else
        puts "Not sure what you want."
      end
    end
  end

  def goodbye
    puts "Goodbye!"
  end


end
