class Cipher
  attr_reader :key
   
  def initialize(key=nil)
    if key.nil? 
      @key = create_key
    else
      raise ArgumentError, "only lower case characters!" unless key.match(/\A[a-z]+\z/)
      @key = key
    end
  end
  
  def encode(plaintext)
    substitute(plaintext, :increment)
  end
  
  def decode(ciphertext)
    substitute(ciphertext, :decrement)
  end
  
  private
  
  def create_key
    letters = ('a'..'z').to_a
    key = ''
    100.times { key << letters.sample }
    key
  end
  
  def substitute(text, method)
    text.bytes.map.with_index do |byte, idx|
      send(method, byte, idx)
    end.join
  end
  
  def increment(value, idx)
    shift_distance = @key[idx].ord - 97
    value = value + shift_distance
    value > 122 ? (value - 26).chr : value.chr
  end
  
  def decrement(value, idx)
    shift_distance = @key[idx].ord - 97
    value = value - shift_distance
    value < 97 ? (value + 26).chr : value.chr 
  end
end
