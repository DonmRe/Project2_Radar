class AdminController < ApplicationController
  before_action :unauthorize_access
  def dashboard
    @posts = Post.all
    @post = Post.new
  end
end
