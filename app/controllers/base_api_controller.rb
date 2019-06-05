class BaseApiController < ActionController::API
  helper_method :current_user

  include ActionController::MimeResponds
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
