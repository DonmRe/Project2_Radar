class LocationsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

 def index
   @locations = Location.all
 end
 def show
 end
 def new
   @location = Location.new
 end
 def create
   @location = Location.new(location_params)

   if @location.save
     redirect_to locations_path
   else
     render as: :post_new
   end
 end
 def edit
 end
 def update
   if @location.update_attributes(location_params)
     redirect_to posts_path
   else
     render as: :post_edit
   end
 end
 def destroy
   @location.destroy
   redirect_to posts_path
 end

private
 def location_params
   params.require(:location).permit(:country, :city, :details)
 end
 def set_location
   @location = Location.find(params[:id])
 end
 end
