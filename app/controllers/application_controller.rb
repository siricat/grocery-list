class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_account
    current_user
  end
  
end
