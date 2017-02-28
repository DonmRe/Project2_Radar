class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :current_user

  def index
    @comments = Comment.all
  end
  def _form
    @post = Post.find(params[:id])
  end
  def show
  end
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
  end
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = @user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to post_path(@post)
    else
      render :new_comment
    end
  end
  def edit
  end
  def update
    if @comment.update_attributes(comment_params)
      redirect_to comments_path if current_user != @comment.user
    else
      render :edit_comment
    end
  end
  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end
  end
