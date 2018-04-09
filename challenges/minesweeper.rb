class ValueError < ArgumentError; end

class Board
  def self.transform(input)
    raise ValueError unless valid?(input)
    input.map.with_index do |line, line_index|
      line.chars.map.with_index do |square, square_index|
        count = 0
        if square == ' '
          count += count_horizontal_mines(line, square_index)
          count += count_vertical_mines(input, line_index, square_index)
          count += count_main_diagonal_mines(input, line_index, square_index)
          count += count_anti_diagonal_mines(input, line_index, square_index)
          count == 0 ? square : count
        else
          square
        end
      end.join
    end
  end
  
  def self.count_horizontal_mines(line, square_index)
    count = 0
    count += 1 if line[square_index - 1] == '*'
    count += 1 if line[square_index + 1] == '*'
    count
  end

  def self.count_vertical_mines(input, line_index, square_index)
    count = 0
    count += 1 if input[line_index - 1][square_index] == '*'
    count += 1 if input[line_index + 1][square_index] == '*'
    count
  end

  def self.count_main_diagonal_mines(input, line_index, square_index)
    count = 0
    count += 1 if input[line_index - 1][square_index + 1] == '*'
    count += 1 if input[line_index + 1][square_index - 1] == '*'
    count
  end

  def self.count_anti_diagonal_mines(input, line_index, square_index)
    count = 0
    count += 1 if input[line_index - 1][square_index - 1] == '*'
    count += 1 if input[line_index + 1][square_index + 1] == '*'
    count
  end

  def self.valid?(input)
    max_size = input.max_by(&:size).size
    input.all? { |line| line.size == max_size } &&
      input[0].match(/\+\-+\+/) && input[-1].match(/\+\-+\+/) &&
      input[1, input.size - 2].all? { |line| line.match(/\|[ *]*\|/) }
  end
end
