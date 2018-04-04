class OCR
  TO_DECIMAL = {
    " _\n| |\n|_|\n" => "0",
    "\n  |\n  |\n" => "1",
    " _\n _|\n|_\n" => "2",
    " _\n _|\n _|\n" => "3",
    "\n|_|\n  |\n" => "4",
    " _\n|_\n _|\n" => "5",
    " _\n|_\n|_|\n" => "6",
    " _\n  |\n  |\n" => "7",
    " _\n|_|\n|_|\n" => "8",
    " _\n|_|\n _|\n" => "9"
  }

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert
    if text.size <= 11
      TO_DECIMAL.fetch(text, "?")
    elsif text.include?("\n\n")
      text.split("\n\n").map { |part| part.split("\n") }
                        .map { |part| to_decimals(part) }
                        .join(",")
    else
      splitted = text.split("\n")
      to_decimals(splitted)
    end
  end

  private

  def to_decimals(splitted)
    numbers = []
    idx = 0
    while idx < splitted[0].size
      top_column = splitted[0][idx, 3]
      middle_column = splitted[1][idx, 3]
      bottom_column = splitted[2][idx, 3]
      check(top_column)
      check(middle_column)
      check(bottom_column)
      numbers << "#{top_column}#{middle_column}#{bottom_column}"
      idx += 3
    end
    numbers.map do |number|
      TO_DECIMAL.fetch(number, "?")
    end.join
  end

  def check(column)
    if column.chars.all? { |col| col == ' ' }
      column.clear << "\n"
    elsif column[-1] ==  ' '
      column[-1] = "\n"
    else
      column << "\n"
    end
  end
end
