class KMP

  # check to see if str1 can
  # be cound in str2
  def self.search str1, str2
    return false if str1.nil? or str2.nil?
    return true if str1 == str2
    score = max_match str1, str2
    return score == str1.length
  end 
  
  # return score of max char 
  # matched between str1 and str2
  def self.max_match str1, str2
    graph = set_graph str1, str2
    x = 0
    max = 0
    (0...str2.length).each {|i|
      c = str2[i]
      x = graph[c][x] unless graph[c][x].nil?
      max = x if max < x 
    }  
    return max
  end 

  def self.set_graph o_str, n_str 
    chars = (o_str+n_str).split("").uniq
    graph = Hash[chars.map {|j| [j, []]}] 
    x = 0
    (0...o_str.length).each { |i|
      c = o_str[i]
      graph.each_pair { |k,v|
        if k == c
          graph[k][i] = i+1 
        else 
          if i ==0
            graph[k][i] = 0  
          else 
            graph[k][i] = graph[k][x]
          end 
        end 
      }
      x = graph[c][x] if i > 0
    }
    return graph 
  end 
  private_class_method :set_graph
end 
