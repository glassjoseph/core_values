class DailiesController < ApplicationController

  def index
    @dailies = current_user.dailies
    @chart_data = current_user.all_scores_list
  end


  def show
    @daily = current_user.dailies.find(params[:id])
  end

  def new
    @daily = Daily.new
  end

  def create
    daily = current_user.dailies.new(daily_params)
    if daily.save
      daily.tag_list(tag_params[:tag_list])
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
    if params[:daily][:score]
      @daily.scores.create(score_params[:score])
      SupporterMailer.supporter_report(current_user).deliver
    end

    if @daily.update(daily_params)
      @daily.tag_list(tag_params[:tag_list])
      flash[:success] = "Goal Updated!"
      redirect_to daily_path(@daily)
    else
      flash.now[:warning] = "Update Unsuccessful"
      render :edit
    end
  end

  def destroy
    @daily = current_user.dailies.find(params[:id])
    @daily.destroy
    flash[:success] = "Goal Deleted"
    redirect_to dailies_path
  end

  private

    def daily_params
      params.require(:daily).permit(:goal, :user_id)
    end

    def score_params
      params.require(:daily).permit(score: [:score, :date] )
    end

    def tag_params
      params.require(:daily).permit(:tag_list)
    end
end
