class Sieve
  def initialize(max_number)
    @primes = (2..max_number).to_a
  end
  
  def primes
    @primes.each do |prime|
      @primes.reject! {|num| num != prime && num % prime == 0 }
    end
    @primes
  end
end

