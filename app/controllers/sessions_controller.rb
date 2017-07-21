class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Login Successful!"
      redirect_to root_path
    else
      flash.now[:danger] = "Login Unsuccessful"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end


  def sessions_param
    params.require(:session).permit(:email, :password)
  end

end
