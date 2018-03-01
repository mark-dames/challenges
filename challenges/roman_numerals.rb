class Integer
  THOUSANDS = { 1000 => 'M', 2000 => 'MM', 3000 => 'MMM'}
  HUNDREDS = { 100 => 'C', 200 => 'CC', 300 => 'CCC', 400 => 'CD', 500 => 'D', 600 => 'DC', 700 => 'DCC', 800 => 'DCCCC', 900 => 'CM'}
  TENS = { 10 => 'X', 20 => 'XX', 30 => 'XXX', 40 => 'XL', 50 => 'L', 60 => 'LX', 70 => 'LXX', 80 => 'LXXX', 90 => 'XC' }
  ONES = { 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX' }

  def to_roman
    roman_numeral = ''
    place = 1000
    divisor, remainder = self.divmod(place)
    loop do
      roman_numeral << get_roman(divisor * place) if divisor != 0
      break if remainder == 0
      place /= 10
      divisor, remainder = remainder.divmod(place)
    end
    roman_numeral 
  end
  
  private 
  
  def get_roman(number)
    size = number.to_s.size
    case size
      when 4 then THOUSANDS[number]
      when 3 then HUNDREDS[number]
      when 2 then TENS[number]
      when 1 then ONES[number]
    end
  end
end