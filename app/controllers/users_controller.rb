class UsersController < ApplicationController
  include UsersHelper

  before_action :require_session, except: %i[new create]

  def index
    @users = User.all
  end

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
    @invited_events = User.find(params[:id]).attended_events
    # @upcoming_events = current_user.attended_events.upcoming
    # @previous_events = @invited_events.previous_events
    @created_events = User.find(params[:id]).events
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
