class PostsController < ApplicationController

  def index
    @posts = Post.all
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
  
end
