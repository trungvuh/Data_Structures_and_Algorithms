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
  # if successfully remove all vertices => the list will hold all the vertices => same length, else, it is not succeeded
  list.length == vertices.length ? list : []
end

# Tarjan's Algorithm
# def topological_sort(vertices)
#   ordering = []
#   explored = Set.new
#
#   vertices.each do |vertex|
#     dfs!(vertex, explored, ordering) unless explored.include?(vertex)
#   end
# end
#
# def dfs!(vertex, explored, ordering)
#   explored.add(vertex)
#
#   vertex.out_edges.each do |edge|
#     new_vertex = edge.to_vertex
#     dfs!(new_vertex, explored, ordering) unless explored.include?(new_vertex)
#   end
#
#   ordering.unshift(vertex)
# end
