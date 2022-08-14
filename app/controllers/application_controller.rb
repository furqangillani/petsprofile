class ApplicationController < ActionController::Base
  helper_method :current_user

  def ensure_current_user
    if current_user.nil?
      redirect_to root_path
    end
  end


end
