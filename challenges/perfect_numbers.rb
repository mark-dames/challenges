class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    
    sum = get_sum(number)
    result = sum <=> number
    case result
      when 1 then 'abundant'
      when -1 then 'deficient'
      else 'perfect'
    end
  end
  
  def self.get_sum(number)
    (1..number-1).reduce(0) do |sum, digit|
      number % digit == 0 ? sum += digit : sum
    end
  end
end