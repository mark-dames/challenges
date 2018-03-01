class PigLatin
  def self.translate(phrase)
    phrases = phrase.split
    pig_latin_word_list = phrases.map do |phrase|
      convert_to_pig_latin(phrase)
    end
    
    pig_latin_word_list.join(' ')
  end
  
  def self.convert_to_pig_latin(phrase)
    if phrase.match(/^(xr|yt|[aeiou]+)([a-z]+)$/)
      phrase + 'ay'
    else
      result = phrase.match(/^(ch|qu|[a-z]+qu|thr|th|sch|[bcdfghijklmnpqrstvwxyz])([a-z]+)$/)
      prefix = result[1]
      rest_of_phrase = result[2]
      rest_of_phrase + prefix + 'ay'
    end
  end
end

