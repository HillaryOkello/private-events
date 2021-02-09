class UsersController < ApplicationController
  def new
    @current_user = nil
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Set a session value
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      flash.notice = 'Error'
    end
  end

  def show
    @user = User.includes(:events_created, :user_registrations).find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
