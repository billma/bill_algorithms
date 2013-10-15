class String 
  def is_correct_format?
    return false unless 
      self[0] =~ /[a-zA-Z]/ and 
      self[1] =~ /[a-zA-Z]/ and 
      self[0] != self[1] and
      self[2..(self.length)] =~ /[0-9]/ 
    return true
  end 
end


class Dijkstra
  attr_accessor :vertices, :edges, :stack, :visited

  def initialize
    @vertices = {} 
    @edges = {}
    @queue = []
    @visited = [] 
  end 

  def set_graph arry 
    return false if arry.nil? || arry.empty? 
    arry.each {|a| 
      return false unless a.is_correct_format? 
      s1,s2,s3=a[0],a[1],a[0..1]
      @vertices[s1]={path:nil}
      add_child s1, s2
      @vertices[s2]={path:nil}
      add_child s2, s1
      @edges[s3]=a[2].to_i
      @edges[s3.reverse]=a[2].to_i
    }
  end 

  def shortest_path start, finish
    return 0 if @vertices.empty? || @edges.empty? 
    @queue << start
    @vertices[start]['path'] = 0
    until @queue.empty? 
      cur_node = @queue.shift
      @vertices[cur_node]['children'].each {|child|
        child_path = @vertices[child]['path']
        parent_path = @vertices[cur_node]['path']
        edge = @edges["#{cur_node+child}"] 
        if child_path.nil? || parent_path + edge < child_path
          @vertices[child]['path'] = parent_path + edge 
          @queue << child
        end 
      }
    end 
    return @vertices[finish]['path'] 
  end 

  private 
  def add_child parent, child
    if @vertices[parent]['children'].nil? 
      @vertices[parent]['children'] = [child]        
    else
      @vertices[parent]['children'] << child 
    end 
  end 
end 
