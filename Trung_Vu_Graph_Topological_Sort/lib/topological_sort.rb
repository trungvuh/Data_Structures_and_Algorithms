require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Kahn's Algorithm
def topological_sort(vertices)
  queue = []
  list = []
  vertices.each { |vertex| queue << vertex if vertex.in_edges.empty? }

  until queue.empty?
    removal = queue.shift
    list << removal

    removal.out_edges.each do |edge|
      outer_vertex = edge.to_vertex
      # remove the edge
      outer_vertex.in_edges.delete(edge)
      # check if that vertex has no more in_edges
      queue << outer_vertex if outer_vertex.in_edges.empty?
    end
  end
  # if successfully remove all vertices => the list will hold all the vertices => same length
  return list if list.length == vertices.length
  # else, it is not succeeded
  []
end

# Tarjan's Algorithm
# def topological_sort(vertices)
#
# end
