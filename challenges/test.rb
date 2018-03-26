class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(sub_data)
    if sub_data <= data
      return @left&.insert(sub_data) || (@left = Bst.new(sub_data))
    end
    @right&.insert(sub_data) || (@right = Bst.new(sub_data))
  end

  def each
    return to_enum if !block_given?
    a = [left&.each {}, data, right&.each {}]
      a.flatten!
      a.compact!
      p a
      a.each { |node| yield(node) }
  end
end