require_relative './version'

class TopFilms::Film

  attr_accessor :title, :rating, :year, :description

  @@all = []

  def initialize(title = nil, rating = nil, year = nil, description = nil)
    @title = title
    @rating = rating
    @year = year
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end


end

TopFilms::Film.new(1)
TopFilms::Film.new(2)
TopFilms::Film.new(3)
TopFilms::Film.new(4)
TopFilms::Film.new(5)
TopFilms::Film.new(6)
TopFilms::Film.new(7)
TopFilms::Film.new(8)
TopFilms::Film.new(9)
TopFilms::Film.new(10)
TopFilms::Film.new(11)
TopFilms::Film.new(12)
TopFilms::Film.new(13)
TopFilms::Film.new(14)
TopFilms::Film.new(15)
TopFilms::Film.new(16)
TopFilms::Film.new(17)
TopFilms::Film.new(18)
TopFilms::Film.new(19)
TopFilms::Film.new(20)
TopFilms::Film.new(21)
TopFilms::Film.new(22)
TopFilms::Film.new(23)
TopFilms::Film.new(24)
TopFilms::Film.new(25)
TopFilms::Film.new(26)
TopFilms::Film.new(27)
TopFilms::Film.new(28)
TopFilms::Film.new(29)
TopFilms::Film.new(30)
TopFilms::Film.new(31)
TopFilms::Film.new(32)
TopFilms::Film.new(33)
TopFilms::Film.new(34)
TopFilms::Film.new(35)
TopFilms::Film.new(36)
TopFilms::Film.new(37)
TopFilms::Film.new(38)
TopFilms::Film.new(39)
TopFilms::Film.new(40)
TopFilms::Film.new(41)
TopFilms::Film.new(42)
TopFilms::Film.new(43)
TopFilms::Film.new(44)
TopFilms::Film.new(45)
TopFilms::Film.new(46)
TopFilms::Film.new(47)
TopFilms::Film.new(48)
TopFilms::Film.new(49)
TopFilms::Film.new(50)
TopFilms::Film.new(51)
TopFilms::Film.new(52)
TopFilms::Film.new(53)
TopFilms::Film.new(54)
TopFilms::Film.new(55)
TopFilms::Film.new(56)
TopFilms::Film.new(57)
TopFilms::Film.new(58)
TopFilms::Film.new(59)
TopFilms::Film.new(60)
TopFilms::Film.new(61)
TopFilms::Film.new(62)
TopFilms::Film.new(63)
TopFilms::Film.new(64)
TopFilms::Film.new(65)
TopFilms::Film.new(66)
TopFilms::Film.new(67)
TopFilms::Film.new(68)
TopFilms::Film.new(69)
TopFilms::Film.new(70)
TopFilms::Film.new(71)
TopFilms::Film.new(72)
TopFilms::Film.new(73)
TopFilms::Film.new(74)
TopFilms::Film.new(75)
TopFilms::Film.new(76)
TopFilms::Film.new(77)
TopFilms::Film.new(78)
TopFilms::Film.new(79)
TopFilms::Film.new(80)
