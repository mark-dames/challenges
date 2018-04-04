class Diamond
  def self.make_diamond(max_letter)
    return "A\n" if max_letter == 'A'

    @spaces = ("A"..max_letter).to_a.size - 1

    first_half = get_first_half_diamond(max_letter)
    second_half = get_second_half_diamond(max_letter)
    (first_half + second_half).join("\n") + "\n"
  end

  def self.get_first_half_diamond(max_letter)
    lines = []
    lines << get_line("A")
    letter = 'B'
    @middle_spaces = 1
    @spaces -= 1
    loop do
      lines << get_line(letter)
      letter = letter.next
      break if letter > max_letter
      @spaces -= 1
      @middle_spaces += 2
    end
    lines
  end

  def self.get_second_half_diamond(max_letter)
    lines = []
    @spaces += 1
    @middle_spaces -= 2
    letter = (max_letter.ord - 1).chr
    loop do
      lines << get_line(letter)
      @spaces += 1
      @middle_spaces -= 2
      letter = (letter.ord - 1).chr
      break if letter < 'B'
    end
    lines << get_line("A")
    lines
  end

  def self.get_line(letter)
    if letter == "A"
      ((' ' * @spaces) + 'A' + (' ' * @spaces))
    else
      (' ' * @spaces) + letter + (' ' * @middle_spaces) + letter + (' ' * @spaces)
    end
  end
end
