class CircularBuffer
  class BufferEmptyException < StandardError ;end
  class BufferFullException < StandardError ;end
  attr_accessor :buffer, :index_oldest_value, :index_newest_value
  
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
    @index_oldest_value = 0
    @index_newest_value = 0
  end
  
  def read
    raise BufferEmptyException if buffer.all? { |element| element.nil? }
    oldest_value = buffer[index_oldest_value]
    buffer[index_oldest_value] = nil
    set_index_oldest_value
    oldest_value
  end
  
  def write(element)
    return if element.nil?
    raise BufferFullException unless buffer.any? { |el| el.nil? }
    buffer[index_newest_value] = element
    set_index_newest_value
  end
  
  def write!(element)
    return if element.nil?
    if buffer.any? { |el| el.nil? }
      write(element)
      return
    end
    
    buffer[index_oldest_value] = element
    set_index_oldest_value
  end
  
  def clear
    buffer.map! { |element| nil }
    self.index_newest_value = 0
    self.index_oldest_value = 0
  end
  
  private
  
  def set_index_oldest_value
    if index_oldest_value + 1 == buffer.size 
      self.index_oldest_value = 0
    else
      self.index_oldest_value += 1
    end
  end
  
  def set_index_newest_value
    if index_newest_value + 1 == buffer.size
      self.index_newest_value = 0
    else
      self.index_newest_value += 1
    end
  end
end