module ApplicationHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_session
    unless current_user
      redirect_to new_user_path, :alert => 'Sign Up or Sign In to access this feature!'
    end
  end

end
