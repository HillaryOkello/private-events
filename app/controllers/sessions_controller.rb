class SessionsController < ApplicationController

  def new
    @session = Session.new
  end

  def create
    @user = User.find_by[session_params]

    @session = Session.new(user_id: @user.id)

    if @session.save?
      redirect_to user_path(@session.user_id)
    else
      render :new_user_path
    end
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end
end
