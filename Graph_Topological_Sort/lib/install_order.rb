# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  max_id = 0
  # find the max id in the array
  arr.each do |el|
    max_id = el[0] if el[0] > max_id
  end

  # making all the vertices
  vertices = (1..max_id).map { |e| Vertex.new(e) }

  # add edges to vertices. From the array element, first one is to_vertex, second one is from_vertex, and we have to minus 1 to get the index from vertices
  arr.each do |el|
    Edge.new(vertices[el[1] - 1], vertices[el[0] - 1])
  end

    # call topological_sort and map out the value
  topological_sort(vertices).map(&:value)

end

# def install_order_2(arr)
#   vertices = Set.new
#   vertices = arr.map { |tuple| Vertices.new(tuple[1]) if tuple[1] }
#
#   arr.each do |tuple|
#
#   end
# end
