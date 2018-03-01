#without conditionals. Using classes. 
class Zero
  def self.return_lyric
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class One
  def self.return_lyric
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class Two
  def self.return_lyric
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class Other
  def self.return_lyric(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around, #{number-1} bottles of beer on the wall.\n"
  end
end

class BeerSong
  LYRICS = {
    0 => Zero.return_lyric,
    1 => One.return_lyric,
    2 => Two.return_lyric,
  }
  
  def verse(number)
    LYRICS.fetch(number, Other.return_lyric(number))
  end
  
  def verses(number1, number2)
    result = []
    number1.downto(number2) {|number| result << verse(number)}
    result.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end
end

#with conditionals
=begin
class BeerSong
  def verse(number)
    if number == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif number == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif number == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number-1} bottles of beer on the wall.\n"
    end
  end
  
  def verses(number1, number2)
    result = []
    number1.downto(number2) {|number| result << verse(number)}
    result.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end
end
=end