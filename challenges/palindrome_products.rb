class Palindrome
  attr_reader :value, :factors
  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end

class Palindromes
  def initialize(**factors)
    @max_factor = factors[:max_factor]
    @min_factor = factors[:min_factor]
    @min_factor = 1 if @min_factor == nil
  end
  
  def generate
    @palindromes = Hash.new { |palindromes, value| palindromes[value] = [] }
    @min_factor.upto(@max_factor) do |factor|
      factor.upto(@max_factor) do |number|
        product = factor * number
        @palindromes[product] << [factor, number] if palindrome?(product)
      end
    end
  end
  
  def largest
    value = @palindromes.keys.max
    factors = @palindromes[value]
    Palindrome.new(value, factors)
  end
  
  def smallest
    value = @palindromes.keys.min
    factors = @palindromes[value]
    Palindrome.new(value, factors)
  end
  
  private
  
  def palindrome?(product)
    product.to_s == product.to_s.reverse
  end
end
