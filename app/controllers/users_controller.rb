class UsersController < ApplicationController
  include UsersHelper

  before_action :require_session, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Set a session value
    if @user.save
      start_session(@user)
    else
      flash.notice = 'Error'
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
