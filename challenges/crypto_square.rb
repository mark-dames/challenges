class Crypto
  def initialize(plaintext)
    @normalize_plaintext = plaintext.downcase.gsub(/[^a-z0-9]/, '')
  end
  
  def normalize_plaintext
    @normalize_plaintext
  end
  
  def size
    plain_text_size = normalize_plaintext.size
    Math.sqrt(plain_text_size).ceil
  end
  
  def plaintext_segments
    n = size
    normalize_plaintext.chars.each_slice(n).to_a.map(&:join)
  end
  
  def ciphertext
    normalize_ciphertext.gsub(/ /, '')
  end
  
  def normalize_ciphertext
    columns = plaintext_segments
    idx = 0
    result = []
    loop do
      break if idx == columns[0].size
      text = ''
      columns.each do |column| 
        char = column[idx]
        text << char unless char.nil?
      end
      result << text
      idx += 1
    end
    result.join(' ')
  end
end




