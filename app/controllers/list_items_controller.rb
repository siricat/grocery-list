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
  
  def edit
    @list = List.find params[:list_id]
    @li = @list.list_items.find params[:id]
    @li.name = @li.product.name
  end
  

  def update
    list = List.find params[:list_id]
    product = current_account.products.find_or_create_by_name params[:list_item].delete(:name)
    li = list.list_items.find params[:id]
    li.user = current_user
    li.product = product
    
    if li.update_attributes params[:list_item]
      flash[:notice] = "#{product.name} was updated."
    else
      flash[:alert] = "#{product.name} was not updated."
    end
    
    redirect_to root_path
  end
  
  def destroy
    list = List.find params[:list_id]    
    li = list.list_items.find params[:id]
    if li.destroy
      flash[:notice] = "#{li.product.name} has been deleted."
      redirect_to :back
    else
      flash[:alert] = "#{li.product.name} could not be deleted."
    end
  end

end
