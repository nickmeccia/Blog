require 'spec_helper'

describe PostsController do
  include Devise::TestHelpers

  before (:each) do
    @admin = Admin.create!(:email => "nickmeccia@gmail.com", :password => "awesome", :password_confirmation => "awesome")
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

  it "redirects to the home page after creation" do
    post :create, :post => { :title => "asdf", :body => "asdfasdf" }
    response.should redirect_to(root_path)
  end
  
  it "destroys a post" do
    new_post = Post.create!(:title => "Foo")
    post :destroy, :id => new_post.id
    Post.exists?(:title => "Foo").should == false
  end
  
  it "puts the posts in descending order" do
    new_post = Post.create!(:title => "post the first", :created_at => Date.today-1.days)
    new_post_two = Post.create!(:title => "post the second", :created_at => Date.today)
    get :index
    assigns[:posts].should == [new_post_two, new_post]
  end

  it "redirects to the home page after updating" do
    new_post = Post.create!(:title => "Foo")
    put :update, :post => { :title => "asdf", :body => "asdfasdf" }, :id => new_post.id
    response.should redirect_to(root_path)
  end
  
  it "updates a specific post" do
    new_post = Post.create!(:title => "Some Post")
    put :update, :post => { :title => "asdf"}, :id => new_post.id
    Post.find(new_post.id).title.should == "asdf"
  end

end