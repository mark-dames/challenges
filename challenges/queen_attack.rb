class Queens
  attr_reader :white, :black
  
  def initialize(white: [0,3], black: [7,3])
    raise ArgumentError if white == black
    @white = white
    @black = black
    @board = Array.new(8) {Array.new(8, '_') }
    place_queens_on_board
  end
  
  def place_queens_on_board
    @board[white[0]][white[1]] = 'W'
    @board[black[0]][black[1]] = 'B'
  end
  
  def attack?
    same_row? || same_column? | same_diagonal?
  end
  
  def to_s
    @board.map { |row| row.join(' ') }.join("\n")
  end
  
  private
  
  def same_row?
    white[0] == black[0]
  end
  
  def same_column?
    white[1] == black[1]
  end
  
  def same_diagonal?
    (black[0] - white[0]).abs == (black[1] - white[1]).abs 
  end
end
