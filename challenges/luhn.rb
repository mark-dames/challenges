class Luhn
  attr_reader :id_number
  
  def initialize(id_number)
    @id_number = id_number
  end
  
  def addends
    digits = id_number.to_s.reverse.chars.map(&:to_i)
    digits.map.with_index do |digit, idx|
      if idx.odd?
        doubled_value = digit * 2
        doubled_value >= 10 ? doubled_value - 9 : doubled_value
      else
        digit
      end
    end.reverse
  end
  
  def checksum
    addends.reduce(:+)
  end
  
  def valid?
    checksum % 10 == 0
  end
  
  def self.create(id_number)
    new_number = id_number * 10
    luhn = new(new_number)
    if luhn.valid?
      new_number
    else
      remainder = luhn.checksum % 10
      new_number + (10 - remainder)
    end
  end
end