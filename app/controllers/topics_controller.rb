class TopicsController < ApplicationController
 before_action :set_topic, only: [:show, :edit, :update, :destroy]
  def index
    @topics = Topic.all
  end
  def new
    @topic = Topic.new(topic_params)
  end
  def show
  end
  def create
    if @topic.save
      redirect_to posts_path
    else
      render :as :post_new
  def edit
  end
  def update
    if @topic.update_attributes(topic_params)
      redirect_to posts_path
    else
      render as: :post_edit
    end
  end
  def destroy
    @topic.destroy
    redirect_to posts_path
  end

private
   def topic_params
     params.require(:topic).permit(:unsolve_misteries, :space_and_astronomy, :paranormal, :conspiracies)
   end
   def set_topic
     @topic = Topic.find(params[:id])
   end
   end
