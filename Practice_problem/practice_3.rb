# in-order-traversal binary_search_trees, iteratively

def inorder_iter(tree_node)
   stack = []
   current = tree_node
   until current.nil? && stack.empty?
     if current
       stack << current
       current = current.left
     else
       top_node = stack.pop
       p top_node.value
       current = top_node.right
     end
   end
 end
