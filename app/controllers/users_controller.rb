class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.first_name} #{@user.last_name}}"
      # redirect_to dailies_path
      redirect_to root_path
    else
      flash.now[:danger] = "Registration Unsuccessful"
      render :new
    end
  end




  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end


end
