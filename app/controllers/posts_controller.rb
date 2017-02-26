class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def show
  end
  def new
  end
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @post.update_attributes(post_params)
      redirect_to :posts
    else
      render :edit
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
private
  def post_params
    params.require(:post).permit(:date, :subject, :data).merge(:location_id => params[:id], :topic_id => params[:id])
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
