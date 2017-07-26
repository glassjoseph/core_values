class DailiesController < ApplicationController

  def index
    @dailies = current_user.dailies
  end


  def show
    @daily = current_user.dailies.find(params[:id])
  end

  def new
    @daily = Daily.new
  end

  def create
    # @daily = Daily.new(daily_params)
    if current_user.dailies.new(daily_params).save
      # session[:daily_id] = @daily.id
      # redirect_to dailies_path
      flash[:success] = "Goal Created!"
      redirect_to dailies_path
    else
      flash.now[:danger] = "Creation Unsuccessful"
      render :new
    end
  end

  def edit
    @daily = current_user.dailies.find(params[:id])
  end

  def update
    @daily = current_user.dailies.find(params[:id])
    if @daily.update(daily_params)
      flash[:success] = "Goal updated!"
      redirect_to dailies_path
    else
      flash.now[:warning] = "Update Unsuccessful"
      render :edit
    end
  end

  def destroy
    @daily = current_user.dailies.find(params[:id])
    @daily.destroy
    flash[:success] = "Goal deleted."
    redirect_to dailies_path
  end


  def daily_params
    params.require(:daily).permit(:goal, :user_id)
  end


end
