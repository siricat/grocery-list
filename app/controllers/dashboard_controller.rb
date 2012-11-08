class DashboardController < ApplicationController

  def index
    @list = current_user.lists.first
    @li = ListItem.new
    @categories = Category.all
  end

end
