class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)                                                                                                                      
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')                                            
    if request.referer == sign_in_url                                                                                                                    
      dashboard_path                                                                                                                                                 
    else                                                                                                                                                    
      stored_location_for(resource) || request.referer || dashboard_path
    end                                                                                                                                                     
  end
  
end
