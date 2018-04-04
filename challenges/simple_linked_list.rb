class Element
  attr_accessor :next
  attr_reader :datum
  
  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end
  
  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head

  def self.from_a(array)
    return new if array.nil? || array.empty?

    list = new
    array.reverse.each { |datum| list.push(datum) }
    list
  end

  def to_a
    array = []
    return array unless @head

    element = @head
    loop do
      array << element.datum
      element = element.next
      break if element.nil?
    end
    array
  end

  def reverse
    new_list = SimpleLinkedList.new
    while @head
      datum = pop
      new_list.push(datum)
    end
    new_list
  end

  def size
    return 0 if empty?
    count = 1
    element = @head
    loop do
      element = element.next
      break if element.nil?
      count += 1
    end
    count
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    element = Element.new(datum, head)
    @head = element
  end

  def pop
    element_datum = @head.datum
    next_element = @head.next
    @head = next_element
    element_datum
  end
  
  def peek
    @head ? @head.datum : nil
  end
end