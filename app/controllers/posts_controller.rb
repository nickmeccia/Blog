class PostsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:index]

  def index
    # @posts = Post.all
    @posts = Post.order("created_at desc").all 
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(params[:post])
    redirect_to(root_path)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(root_path)
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to(root_path)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
end




