class Prime
  def self.nth(nth_prime)
    raise ArgumentError if nth_prime < 1
    return 2 if nth_prime == 1
    prime_count = 1
    number = 3
    loop do
      prime_count += 1 if prime?(number)
      return number if prime_count == nth_prime
      number += 2
    end
  end
  
  private
  
  def self.prime?(number)
    square_root = Math.sqrt(number).round
    digit = 2
    loop do
      break if digit > square_root
      return false if number % digit == 0
      digit += 1
    end
    true
  end
end