# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
    else
      node = self.find_insert(@root, value)
      if value <= node.value
        node.left = BSTNode.new(value, node)
      else
        node.right = BSTNode.new(value, node)
      end
    end
  end

  def find(value, tree_node = @root)
    return tree_node if value == tree_node.value
    node = self.find_node(tree_node, value)

    return node if node.value == value
    nil
  end

  def delete(value)
    node = self.find(value)

    if node == @root
      @root = nil
      return
    end

    parent_node = node.parent if node

    if !node.left && !node.right #no children
      parent_node.right = nil if parent_node.value < value
      parent_node.left = nil if parent_node.value >= value
    elsif !node.left ^ !node.right #has 1 child

      if parent_node.left == node

        if node.left
          parent_node.left = node.left
          node.left.parent = parent_node
        else
          parent_node.left = node.right
          node.right.parent = parent_node
        end
      else

        if node.left
          parent_node.right = node.left
          node.left.parent = parent_node
        else
          parent_node.right = node.right
          node.right.parent = parent_node
        end
      end

    else #has 2 children
      max_node = self.maximum(node.left)
      node.parent.left = max_node

      max_node.left = node.left
      max_node.right = node.right
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if !tree_node.right
    self.maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?

    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    if left_depth > right_depth
      return left_depth + 1
    else
      return right_depth + 1
    end
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    return false if (left_depth - right_depth).abs > 1

    return true if self.is_balanced?(tree_node.left) && self.is_balanced?(tree_node.right)

    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    arr << tree_node.value

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
  end


  protected
  # optional helper methods go here:

  def find_node(top_node, value)
    return top_node if value == top_node.value

    if value < top_node.value
      if top_node.left
        self.find_node(top_node.left, value)
      else
        top_node
      end
    else
      if top_node.right
        self.find_node(top_node.right, value)
      else
        top_node
      end
    end
  end

  def find_insert(top_node, value)
    if value <= top_node.value
      if !top_node.left #|| top_node.left.value == value
        top_node
      else
        self.find_insert(top_node.left, value)
      end
    else
      if !top_node.right #|| top_node.right.value == value
        top_node
      else
        self.find_insert(top_node.right, value)
      end
    end
  end

end
