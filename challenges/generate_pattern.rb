def generate_pattern(max_number)
  numbers = (1..max_number).to_a
  width = numbers.join.size
  numbers.map do |number|
    (1..number).to_a.join.ljust(width, '*')
  end.join("\n")
end

puts generate_pattern(20)