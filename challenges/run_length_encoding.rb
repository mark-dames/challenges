class RunLengthEncoding
  def self.encode(input)
    count = 0
    current_counted_letter = input[0]
    encoded = ''
    input.chars.each do |letter|
      count += 1 if letter == current_counted_letter
      if letter != current_counted_letter
        add_to_encoded(count, current_counted_letter, encoded)
        current_counted_letter = letter
        count = 1
      end
    end
    add_to_encoded(count, input[-1], encoded)
    encoded
  end
  
  def self.add_to_encoded(count, current_counted_letter, encoded)
    count == 1 ? encoded << current_counted_letter : encoded << "#{count}#{current_counted_letter}"
  end
  
  def self.decode(input)
    digit = ''
    decoded_string = ''
    input.chars.each_with_index do |char, idx|
      if char =~ /[0-9]/
        digit << char
      else
        if input[idx-1] =~ /[0-9]/
          decoded_string << char * digit.to_i
          digit = ''
        else
          decoded_string << char
        end
      end
    end
    decoded_string
  end
end