#Algorithms 

  This repo contains ruby implementation of some of my favorite algorithm problems.


##Dijkstra Algorithm Implementation

###example: 

        djk = Dijkstra.new 
        djk.set_graph ["ab4", "bc5"]
        djk.shortest_path "a", "b"  #=> 8

##Knuth-Morris-Pratt Implementation

###example: 
 
####find string in another string  

        KMP.search "abc", "xxabcxxx" #=> true

####find max chars found between two strings

	 KMP.max_match "abcd", "ab" #=> 2


##Fill Paint Algorithms

Given a screen (2d array) of colors, a point and a new color, fill in the surrouding area util the color changes from the original color

###example 

        p = Paint.new 
        p.map = [["a","a","a"], 
                 ["a","c","c"],
                 ["a","c","c"]]
        p.fill 0, 0, "b", "a"
        p.map #=>  [["b","b","b"], 
                    ["b","c","c"],
                    ["b","c","c"]]

        





