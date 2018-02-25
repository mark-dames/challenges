class Trinary
  def initialize(trinary_string)
    @trinary_string = trinary_string
  end
  
  def to_decimal
    return 0 if @trinary_string.match(/[^0-2]/)
    decimals = @trinary_string.chars.map(&:to_i).reverse.map.with_index {|digit, idx| digit * (3 ** idx)}
    decimals.reduce(:+)
  end
end