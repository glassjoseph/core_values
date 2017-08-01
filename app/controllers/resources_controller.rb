class ResourcesController < ApplicationController

  def index
    @resources = current_user.resources
  end

  def new
    @resource = Resource.new
  end

  def create
    new_resource = current_user.resources.new(resource_params)
    if new_resource.save
      new_resource.tag_list(tag_params[:tag_list])
      flash[:success] = "Resource Created!"
      redirect_to resources_path
    else
      flash.now[:danger] = "Creation Unsuccessful"
      @resource = Resource.new
      render :new
    end
  end

  def edit
    @resource = current_user.resources.find(params[:id])
  end

  def update
    @resource = current_user.resources.find(params[:id])
    if @resource.update(resource_params)
      @resource.tag_list(tag_params[:tag_list])
      flash[:success] = "Resource Updated!"
      redirect_to resources_path
    else
      flash.now[:warning] = "Update Unsuccessful"
      render :edit
    end
  end

  def destroy
    @resource = current_user.resources.find(params[:id])
    @resource.destroy
    flash[:success] = "Resource Deleted"
    redirect_to resources_path
  end

  def resource_params
    params.require(:resource).permit(:resource_type, :content, :notes)
  end

  def tag_params
    params.require(:resource).permit(:tag_list)
  end
end
