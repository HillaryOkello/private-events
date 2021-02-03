class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Set a session value
    session[:current_user_id] = @user.id
    session[:current_user_name] = @user.name
    
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
