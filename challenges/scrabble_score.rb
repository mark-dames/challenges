class Scrabble
  SCORE_TABLE = {
    %w(a e i o u l n r s t) => 1,     
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10
  }

  def initialize(word)
    @word = word
  end
  
  def score
    return 0 if @word.nil? || @word.empty?
    word = @word.downcase
    score = 0
    SCORE_TABLE.keys.each do |letter_list|
      letter_list.each do |letter|
        score += (SCORE_TABLE[letter_list] * word.count(letter)) if word.include?(letter)
      end
    end
    score
  end
  
  def self.score(word)
    new(word).score
  end
end