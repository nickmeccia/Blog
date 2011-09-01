require 'spec_helper'

describe PostsController do
  include Devise::TestHelpers

  before (:each) do
    @admin = Admin.create!(:email => "nickmeccia@gmail.com", :password => "nickisawesome", :password_confirmation => "nickisawesome")
    sign_in @admin    
  end
  
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

  it "redirects to the home page" do
    post :create, :post => { :title => "asdf", :body => "asdfasdf" }
    response.should redirect_to(root_path)
  end
  
  it "destroys a post" do
    new_post = Post.create!(:title => "Foo")
    
    post :destroy, :id => new_post.id
    
    Post.exists?(:title => "Foo").should == false
  end
end