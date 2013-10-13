require 'spec_helper'

describe Dijkstra do
  before :each do 
    @djk = Dijkstra.new
  end 
  it "returns new dijkstra object" do 
    @djk.should be_an_instance_of Dijkstra
  end 

  it "sets vertices and edges" do 
    @djk.vertices = {a: nil, b:nil}
    @djk.edges = {ab: 5}
  end  
end
