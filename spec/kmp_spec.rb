require 'spec_helper'

describe KMP do 
  describe "#search" do 
    it "should handle nil string comparison" do
      KMP.search(nil, nil).should eql false 
    end 

    it "should handle same string comparison" do 
      KMP.search("a","a").should eql true 
    end 
    
    it "complex string comparison" do
      KMP.search("abc", "ab").should eql false
      KMP.search("ababac", "abababacdd").should eql true 
    end 
  end 

  describe "#max_match" do 
    it "single char case" do 
      KMP.max_match("a", "a").should eql 1
    end  
     it "complex cases" do 
      KMP.max_match("abc", "ab").should eql 2 
      KMP.max_match("abb","bbb").should eql 2
      KMP.max_match("bbb","babb").should eql 2
      KMP.max_match("ababac", "abababacdd").should eql 6
     end 
  end 
end 
