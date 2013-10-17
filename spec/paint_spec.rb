require "spec_helper"

describe Paint do 
  before :each do 
    @p = Paint.new
  end 

  it "initialize" do 
    @p.should be_an_instance_of Paint
  end 
  
  it "sets map" do 
    @p.map = [] 
    @p.map.should_not be_nil
  end 

  describe "#fill" do 
    it "single case" do 
      @p.map = ["b"]
      @p.fill 0, 0, "a", "b"
      @p.map[0].should eql "a"
    end 
    
    it "single row case" do 
      @p.map = [["a","a","a"]]
      @p.fill 0, 0, "b", "a"
      @p.map[0][0].should eql "b"
    end 

    it "single column case" do 
      @p.map = ["a","a", "a"]
      @p.fill 0, 0, "b", "a"
      @p.map[0].should eql "b"
    end 

    it "discontinous color sets" do 
      @p.map = [["a","a","a"],
                ["c","c","c"],
                ["c","a","c"]]
      @p.fill 0, 0, "b", "a"
      @p.map[0][0].should eql "b"
      @p.map[2][1].should eql "a"
    end 

    it "complex case" do 
      @p.map = [["a","c","c"],
                ["a","a","c"],
                ["a","c","c"]]
      @p.fill 1, 1, "b", "a"
      @p.map[1][0].should eql "b"
      @p.map[1][2].should eql "c"
    end 
  end 
end 
