class DashboardController < ApplicationController
  
  def index
    @list = current_account.list
    @li = ListItem.new
    @categories = Category.all
  end
  
end
