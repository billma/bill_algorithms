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

    it "should initalize value for vertices edges" do
      @djk.set_graph ["ae8"]
      @djk.vertices.length.should equal 2 
      @djk.vertices['a']['path'].should be_nil
      @djk.vertices['a']['children'].length.should equal 1
      @djk.edges['ae'].should equal 8
    end 
  end  

  describe "#shortest_path" do
    it "should return 0 for empty graph" do
      expect(@djk.shortest_path "a", "b" ).to be 0
    end 

    it "should return 8 for [ae8]" do
      @djk.set_graph ["ae8"]
      expect(@djk.shortest_path "a", "e" ).to be 8
    end 
    
    it "should return 8 for [ac6, cd2]" do 
      @djk.set_graph ["ac6", "cd2"]
      expect(@djk.shortest_path "a", "d").to be 8
    end 

    it "should return 2 for [ac6, cd2, ad2]" do 
      @djk.set_graph ["ac6", "cd2", "ad2"]
      expect(@djk.shortest_path "a", "d").to be 2 
    end 
  end 
end
