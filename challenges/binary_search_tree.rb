class Bst
  attr_accessor :data, :left, :right
  
  def initialize(data)
    @data = data
  end
  
  def insert(number)
    if number <= data
      self.left.nil? ? self.left = Bst.new(number) : self.left.insert(number)
    else
      self.right.nil? ? self.right = Bst.new(number) : self.right.insert(number)
    end
  end
  
  def each &block
    return to_enum :each unless block_given?

    left.each(&block) if left
    yield @data
    right.each(&block) if right
  end
end
 