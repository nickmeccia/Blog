require 'spec_helper'

describe Post do
  context "last title line" do
    it "returns the last word" do
      post = Post.new(:title => "This is a blog post, person")
      post.last_title_line.should == "person"
    end
    
    it "returns a different last word" do
      post = Post.new(:title => "This is a blog post, lastword")
      post.last_title_line.should == "lastword"
    end
    
    it "returns the last two words for a short last word" do
      post = Post.new(:title => "This is a blog post, son")
      post.last_title_line.should == "post, son"
    end
    
    it "returns nothing if it is only one short word long" do
      post = Post.new(:title => "123")
      post.last_title_line.should be_blank
    end
    
    it "returns nothing if two short words" do
      post = Post.new(:title => "go die")
      post.last_title_line.should == "go die"
    end
  end
end
