class ListItemsController < ApplicationController

  def create
    list = List.find params[:list_id]
    product = current_account.products.find_or_create_by_name params[:list_item].delete(:name)
    li = list.list_items.new params[:list_item]
    li.user = current_user
    li.product = product
    
    if li.save
      flash[:notice] = "Added #{product.name} to your list."
    else
      flash[:alert] = "There was a problem adding #{product.name} to your list."
    end
    
    redirect_to :back
  end

  def update
  end
  
  def destroy
  end

end
