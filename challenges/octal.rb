class Octal
  def initialize(octal)
    @octal = octal
  end
  
  def to_decimal
    return 0 if @octal.match(/[^0-7]/)
    @octal.chars.reverse.map(&:to_i).map.with_index do |digit, idx|
      digit *  (8 ** idx)
    end.reduce(:+)
  end
end
