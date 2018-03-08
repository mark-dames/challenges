class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number
  end
  
  def number
    return '0000000000' if @phone_number.match(/[a-z]/i)
    clean_number = @phone_number.gsub(/[\.\-\(\) ]/, '')
    return '0000000000' if invalid_number?(clean_number)
    clean_number.size == 11 ? clean_number[1..-1] : clean_number
  end
  
  def area_code
    number.slice(0,3)
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line_number}"
  end
  
  private
  
  def invalid_number?(clean_number)
    size = clean_number.size
    size < 10 || size > 11 || size == 11 && clean_number[0] != '1'
  end
  
  def prefix
    number.slice(3,3)
  end
  
  def line_number
    number.slice(6, 4)
  end
end