def odd_words(sentence)
  return "invalid sentence" unless sentence.match(/^[a-zA-Z]{1,20}(\s+[a-zA-Z]{1,20}\s*)*\.$/)
  
  word_index = 0
  word = ''
  output = ''
  sentence.each_char.with_index do |char, idx|
    if char.match(/[a-zA-Z]/)
      word << char
    elsif char == ' ' && sentence[idx+1].match(/[a-zA-Z]/)
      word_index.odd? ? output << word.reverse << ' ' : output << word << ' '
      word = ''
      word_index += 1
    elsif char == '.' && sentence[idx-1].match(/[a-zA-Z]/)
      word_index.odd? ? output << word.reverse << '.' : output << word << '.'
    elsif char == '.' && sentence[idx-1] == ' '
      word_index.odd? ? output << word.reverse << ' .' : output << word << ' .'
    end
  end
  output
end

puts odd_words("whats the matter with kansas.")
puts odd_words("whats     the matter with kansas  .")
puts odd_words("Hello World My name is Mark") 
puts odd_words("whats the matter with kansas.")