class Atbash
  FIRST_13_LETTERS = %w(a b c d e f g h i j k l m)
  LAST_13_LETTERS = %w(z y x w v u t s r q p o n)
  
  def self.encode(string)
    words = string.gsub(/ |,/, '').downcase.scan(/[a-z0-9]{5}|[a-z0-9]{1,}/)
    if words.size > 1
      words.map do |word|
        get_encoded(word)
      end.join(' ')
    else
      get_encoded(string)
    end
  end
  
  def self.get_encoded(string)
    characters = string.gsub(/ /, '').downcase.chars
    characters.map do |character|
      if character.match(/[0-9]/)
        character
      elsif FIRST_13_LETTERS.include?(character)
        idx = FIRST_13_LETTERS.index(character)
        LAST_13_LETTERS[idx]
      else
        idx = LAST_13_LETTERS.index(character)
        FIRST_13_LETTERS[idx]
      end
    end.join
  end
end