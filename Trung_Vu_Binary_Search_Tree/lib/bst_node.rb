class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent

  def initialize(value, parent = nil)
    @value = value
    @left = nil
    @right = nil
    @parent = parent
  end

  # def parent(child)
  #   return parent if parent.left == child || parent.right == child
  #   return true if [@left, @right].include?(child)
  #   false
  # end
end
