class RailFenceCipher
  def self.encode(plain_text, rails)
    return plain_text if plain_text.empty? || rails < 2 || rails > plain_text.size
    
    clean_text = plain_text.gsub(' ', '')
    rail_fence = zig_zag_shape(clean_text, rails)
    rail_fence.map(&:join).join
  end
  
  def self.decode(encoded_text, rails)
    return encoded_text if encoded_text.empty? || rails < 2 || rails > encoded_text.size
    text = '?' * encoded_text.size
    rail_fence = zig_zag_shape(text, rails)
    index = 0
    rail_fence.map! do |rail|
      rail.map! do |el|
        if el == '?'
          letter = encoded_text[index]
          index += 1
          letter
        else
          el
        end
      end
    end
    rail_fence.transpose.map(&:join).join
  end
  
  def self.zig_zag_shape(clean_text, rails)
    rail_fence = Array.new(rails) { Array.new(clean_text.size) }
    rail_index = 0
    position = 0
    downwards = true
    loop do
      break if position == clean_text.size
      rail_fence[rail_index][position] = clean_text[position]
      
      downwards ? rail_index += 1 : rail_index -= 1

      if rail_index == rail_fence.size-1
        downwards = false
      elsif rail_index == 0
        downwards = true
      end
      position += 1
    end
    rail_fence
  end
end