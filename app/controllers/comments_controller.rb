class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end
  def show
  end
  def new
    @commnent = Comment.new
  end
  def create
    @commnent = Comment.new(comment_params)

    if @commnent.save
      redirect_to comments_path
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @commnent.update_attributes(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end
  def destroy
    @commnent.destroy
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
  def set_comment
    @commnent = Comment.find(params[:id])
  end
  end
