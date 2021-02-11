module RegistrationsHelper
  def registratation_params
    params.require(:registration).permit(:user, :event, :user_id, :event_id)
  end
end
