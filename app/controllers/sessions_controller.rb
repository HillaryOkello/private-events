class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_name(params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(current_user.id), notice: "Signed in successfully!"
    else
      flash.now[:alert] = "Username is invalid"
      render 'new'
    end
  end


  def destroy
    reset_session
    redirect_to root_url, notice: "Signed out successfully!"
  end

end
