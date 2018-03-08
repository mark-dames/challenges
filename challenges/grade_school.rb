class School
  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = [] }
  end
  
  def to_h
    @roster.sort_by {|grade,_| grade }.to_h
  end
  
  def add(student, grade)
    @roster[grade] << student
    @roster[grade].sort!
  end
  
  def grade(number)
    @roster[number]
  end
end