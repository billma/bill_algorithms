class Paint 
  attr_accessor :map

  def fill x, y, nC, oC
    columns = @map[0].is_a?(Array) ? @map[0].length : 0 
    cC= @map[y].is_a?(Array) ? @map[y][x] : @map[y]
   if x < 0 or x >= @map.length or
      y < 0 or y > columns or 
      cC != oC
      return 
   else 
    if columns > 0 
      @map[y][x] = nC
    else 
      @map[y]= nC
    end  
    fill x-1, y, nC, oC 
    fill x+1, y, nC, oC
    fill x, y-1, nC, oC
    fill x, y+1, nC, oC 
   end 
  end
end 
