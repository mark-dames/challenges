class WordProblem
  TO_OPERATOR = { 'plus' => '+', 'minus' => '-' , 'divided by' => '/', 'multiplied by' => '*' }
  def initialize(word_problem)
    @operators = word_problem.scan(/plus|minus|divided by|multiplied by/).map { |command| TO_OPERATOR[command] }
    @numbers = word_problem.scan(/-?[0-9]+/).map(&:to_i)
  end
  
  def answer
    raise ArgumentError if @operators.size < 0 || @numbers.size < 2
    sum = @numbers[0]
    idx = 1
    @operators.each do |operator|
      sum = sum.send operator, @numbers[idx]
      idx += 1
    end
    sum
  end
end
