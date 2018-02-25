class Series
  def initialize(digit_string)
    @digits = digit_string.chars.map(&:to_i)
  end
  
  def slices(length)
    raise ArgumentError if length > @digits.size
    series = []
    @digits.each_with_index do |digit, idx|
       break if idx + length > @digits.size
       series << @digits.slice(idx, length)
     end
     series
  end
end