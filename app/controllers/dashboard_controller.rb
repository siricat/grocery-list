class DashboardController < ApplicationController
  
  def index
    @list = current_account.list
    @li = ListItem.new
  end
  
end
