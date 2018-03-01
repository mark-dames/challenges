class Phrase
  def initialize(phrase)
    @phrase = phrase
  end
  
  def word_count
    occurences = Hash.new(0)
    words = @phrase.downcase.scan(/\b[a-z]+'?[a-z]+|[0-9]+\b/)
    words.each do |word|
      occurences[word] += 1
    end
    occurences
  end
end