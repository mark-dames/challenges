class Triplet
  attr_reader :numbers
  
  def self.where(min_factor: 1, max_factor:, sum: nil)
    triplets = []
    (min_factor..max_factor).to_a.combination(3) do |numbers|
      triplet = Triplet.new(*numbers)
      triplets << triplet if triplet.pythagorean?
    end

    sum ? triplets.select { |triplet| triplet.sum == sum } : triplets
  end

  def initialize(*numbers)
    @numbers = numbers
  end

  def sum
    numbers.reduce(&:+)
  end

  def product
    numbers.reduce(&:*)
  end

  def pythagorean?
    numbers[0]**2 + numbers[1]**2 == numbers[2]**2
  end
end
