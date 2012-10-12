class ListItemsController < ApplicationController

  before_filter :get_category, :only => [:create, :update]
  before_filter :get_product, :only => [:create, :update]
  before_filter :get_list
  before_filter :get_list_item, :except => [:create]
  
  def create
    @li = @list.list_items.new params[:list_item]
    @li.user = current_user
    @li.product = @product
    
    if @li.save
      flash[:notice] = "Added #{@product.name} to your list."
    else
      flash[:alert] = "There was a problem adding #{@product.name} to your list."
    end
    
    redirect_to :back
  end
  
  def edit  
    @li.name = @li.product.name
    @categories = Category.all
  end

  def update
    @li.user = current_user
    @li.product = @product
    
    if @li.update_attributes params[:list_item]
      flash[:notice] = "#{@product.name} was updated."
    else
      flash[:alert] = "#{@product.name} was not updated."
    end
    
    redirect_to root_path
  end
  
  def destroy   
    if @li.destroy
      flash[:notice] = "#{@li.product.name} has been deleted."
      redirect_to :back
    else
      flash[:alert] = "#{@li.product.name} could not be deleted."
    end
  end

private

  def get_category
    @category = Category.find params[:list_item][:category_id]
  end

  def get_product    
    product_name = params[:list_item].delete(:name)
    unless @product = current_account.products.find_by_name(product_name)
      @product = current_account.products.create({
        :name => product_name, 
        :category => @category
      })
    end
  end

  def get_list
    @list = List.find params[:list_id]    
  end

  def get_list_item
    @li = @list.list_items.find params[:id]
  end

end




