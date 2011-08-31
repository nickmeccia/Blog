require 'spec_helper'

describe PostsController do
  it "finds all posts" do
    post = Post.create!(:title => "Some Post")
    
    get :index
    
    assigns[:posts].should == [post]
  end
  
  it "saves a new post" do
    #simulate/send info to create action with some post paramesters
    post :create, :post => { :title => "asdf", :body => "asdfasdf" }
    #check that a post is created with those parameters
    Post.exists?(:title => "asdf", :body => "asdfasdf").should == true
  end
end