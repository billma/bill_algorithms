require 'spec_helper'

describe Dijkstra do
  before :each do 
    @djk = Dijkstra.new
  end 

  describe "#initialize" do
    it "returns new dijkstra object" do 
      @djk.should be_an_instance_of Dijkstra
    end 
  end
  
  # test input validity
  describe "#set_graph" do
    it "should return false for empty or nil input " do
      expect(@djk.set_graph nil).to be false
      expect(@djk.set_graph []).to be false
      expect(@djk.set_graph [""]).to be false
    end 

    it "should return false for input [a8,aa8,aaa8] " do
      expect(@djk.set_graph ["a8"]).to be false
      expect(@djk.set_graph ["aa8"]).to be false
      expect(@djk.set_graph ["aaa8"]).to be false
      @djk.vertices.length.should equal 0
    end 

    it "should return false for input [8,88,888]" do 
      expect(@djk.set_graph ["8"]).to be false
      expect(@djk.set_graph ["88"]).to be false
      expect(@djk.set_graph ["888"]).to be false
      @djk.vertices.length.should equal 0
    end 

    it "should return false for input [a,aa,aaa]" do 
      expect(@djk.set_graph ["a"]).to be false
      expect(@djk.set_graph ["aa"]).to be false
      expect(@djk.set_graph ["aaa"]).to be false
      @djk.vertices.length.should equal 0
    end 

    it "should parse two digit path" do 
      @djk.set_graph ["ae18"]
      @djk.edges['ae'].should equal 18
    end 

    it "should initalize value for vertices edges" do
      @djk.set_graph ["ae8"]
      @djk.vertices.length.should equal 2 
      @djk.vertices['a']['path'].should be_nil
      @djk.vertices['a']['children'].length.should equal 1
      @djk.edges['ae'].should equal 8
    end 
  end  
  
  # test algorithm logic
  describe "#shortest_path" do
    it "should find no path " do
      @djk.shortest_path( "a", "b" ).should eql 0
    end 

    it "should find one path" do
      @djk.set_graph ["ae8"]
      @djk.shortest_path("a", "e" ).should eql 8
    end 
    
    it "should find straight path" do 
      @djk.set_graph ["ac6", "cd2"]
      @djk.shortest_path("a", "d").should eql 8
    end 

    it "should find direct path" do 
      @djk.set_graph ["ac6", "cd2", "ad2"]
      @djk.shortest_path("a", "d").should eql 2 
    end 

    it "should find multiple path" do 
      @djk.set_graph ["ab1", "ac3", "bd2", "cd4"]
      @djk.shortest_path("a", "d").should eql 3 
    end 

    it "should handle complex cases" do
      @djk.set_graph ["ab12", "bc3", "ce10", "de1", "ad7", "ac1", "dc9"]
      @djk.shortest_path( "a", "e" ).should eql 8
      @djk.shortest_path( "b", "d" ).should eql 11
      @djk.shortest_path( "d", "b" ).should eql 11
      @djk.shortest_path( "b", "e" ).should eql 12
    end 
  end 
end
