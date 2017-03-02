class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, except: [:index, :show]
  before_action :authorize, only: [:show]
  before_action :current_user

  def index
    @posts = Post.all
    @unsolved_mysteries = Post.where(:topic => "Unsolved Mysteries").last
    @space_and_astronomy = Post.where(:topic => "Space and Astronomy").last
    @paranormal = Post.where(:topic => "Paranormal").last
    @conspiracies = Post.where(:topic => "Conspiracies").last
  end
  def show
    @comments = Comment.all
    @comment = Comment.new
  end
  def new
    @post = Post.new
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
      redirect_to posts_path, notice: "Post has been updated"
    else
      render :edit
    end
  end
  def destroy
    @post.destroy
    redirect_to :dashboard, alert: "Post has been deleted"
  end

private

  def post_params
    params.require(:post).permit(:topic, :place, :subject, :date, :data)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
