class Vertex
  attr_accessor :value, :edges
  def initialize(val)
    @value = val
    @edges = {}
  end

end

class Graph

  attr_accessor :vertices, :total_vertices, :total_edges

  def initialize
    @vertices = {}
    @total_vertices = 0
    @total_edges = 0
  end

  def add_vertex(id)
    if @vertices[id]
      return 'vertex already exists'
    else
      new_vertex = Vertex.new(id)
      @vertices[id] = new_vertex
      @total_vertices += 1
    end
  end

  def get_vertex(id)
    if @vertices[id]
      return @vertices[id]
    else
      return 'vertex does not exist'
    end
  end

  def add_edge(id1, id2)
    if @vertices[id1] && @vertices[id2]
      if @vertices[id1].edges[id2] && @vertices[id2].edges[id2]
        return 'edge already exists'
      else
        @vertices[id1].edges[id2] = true
        @vertices[id2].edges[id1] = true
        @total_edges += 1
      end
    else
      return 'vertex does not exist'
    end
  end


  def remove_edge(id1, id2)
    if @vertices[id1] && @vertices[id2]
      if @vertices[id1].edges[id2] && @vertices[id2].edges[id1]
        @vertices[id1].edges.delete(id2)
        @vertices[id2].edges.delete(id1)
        @total_edges -= 1
      else
        return 'edge does not exist'
      end
    else
      return 'vertex does not exist'
    end
  end

  def remove_vertex(id)
    if @vertices[id]
      @vertices.delete(id)
      @total_vertices -= 1
    else
      return 'vertex does not exist'
    end
  end

  def shortest_path(id1, id2)
    @answer_array = []
    @id2 = id2

    def depth_traverse(current_v, str_path)
      if current_v.value == @id2
        str_path += current_v.value
        @answer_array << str_path
        return
      else
        # str_path += current_v.value
        current_v.edges.each{ |edge, value| depth_traverse(get_vertex(edge), str_path + current_v.value)}
      end

    end
    depth_traverse(get_vertex(id1), '')
    @answer_array
  end

end


g = Graph.new
g.add_vertex(1)
g.add_vertex(2)

g.add_edge(1, 2)
g.remove_edge(1,2)
g.remove_vertex(5)

g.remove_vertex(1)
p g

# g.vertices['A'].edges['B'] = true;
# g.vertices['A'].edges['C'] = true;
# g.vertices['B'].edges['D'] = true;
# g.vertices['D'].edges['C'] = true;
# g.vertices['C'].edges['E'] = true;
# g.vertices['D'].edges['E'] = true;
# g.vertices['E'].edges['F'] = true;