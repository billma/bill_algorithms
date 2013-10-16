#Algorithms 

  This repo contains ruby implementation of some of my favorite algorithm problems.


#Dijkstra Algorithm Implementation

###example: 

        djk = Dijkstra.new 
        djk.set_graph ["ab4", "bc5"]
        djk.shortest_path "a", "b"  #=> 8

#Knuth-Morris-Pratt Implementation

###example: 
 
####find string in another string  

        KMP.search "abc", "xxabcxxx" #=> true

####find max chars found between two strings

	 KMP.max_match "abcd", "ab" #=> 2



