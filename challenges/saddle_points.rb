class Matrix
  attr_reader :rows, :columns
  
  def initialize(matrix)
    @rows, @columns = get_rows_and_columns(matrix)
  end
  
  def saddle_points
    saddle_points = []
    rows.each_with_index do |row, row_idx|
      row.each_with_index do |number, column_idx|
        if saddle_point?(row, column_idx, number)
          saddle_points << [row_idx, column_idx]
          break
        end
      end
    end
    saddle_points
  end
  
  private
  
  def saddle_point?(row, column_idx, number)
    row.all? { |digit| number >= digit } &&
      columns[column_idx].all? { |digit| number <= digit }
  end
  
  def get_rows_and_columns(matrix)
    rows = matrix.split("\n").map do |str|
      str.split(" ").map(&:to_i)
    end
    columns = rows.transpose
    [rows, columns]
  end
end