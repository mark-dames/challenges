class Triangle
  attr_accessor :row_number
  def initialize(row_number)
    @row_number = row_number
  end
  
  def rows
    return [[1]] if row_number == 1
    triangles = [[1], [1,1]]
    loop do
      return triangles.slice(0, row_number) if triangles.size == row_number
      last_triangle = triangles.last
      result = last_triangle.each_cons(2).map do |triangle|
        triangle.reduce(:+)
      end
      result.unshift(1)
      result.push(1)
      triangles << result
    end
  end
end