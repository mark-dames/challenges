class Anagram
  def initialize(word)
    @orginal_word = word.downcase
    @sorted_orginal_word = @orginal_word.chars.sort
  end
  
  def match(words)
    anagrams = []
    words.each do |word|
      anagrams << word if anagram?(word.downcase)
    end
    anagrams
  end
  
  private
  
  def anagram?(word)
    @sorted_orginal_word == word.chars.sort && word != @orginal_word
  end
end