class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples  
  end
  
  def multiples_of_3_and_5(number)
    sum = 0
    3.upto(number-1) do |digit|
      if digit % 3 == 0
        sum += digit
      elsif digit % 5 ==0
        sum += digit
      end
    end
    sum
  end
  
  def self.to(number)
    SumOfMultiples.new.multiples_of_3_and_5(number)
  end
  
  def to(number)
    return multiples_of_3_and_5(@multiples[0]) if @multiples.size == 1
    
    sum = 0
    1.upto(number-1) do |digit|
     sum += digit if  @multiples.any? { |multiple| digit % multiple == 0 }
   end
   sum
  end
end
