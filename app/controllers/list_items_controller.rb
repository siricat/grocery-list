class ListItemsController < ApplicationController

  before_filter :get_category, :only => [:create, :update, :position]
  before_filter :get_list
  before_filter :get_product, :only => [:create, :update]
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

    if @li.update_attributes(params[:list_item])
      flash[:notice] = "#{@product.name} was updated."
      redirect_to list_path(@list)
    else
      flash[:alert] = "#{@product.name} was not updated."
      redirect_to :back
    end
  end

  def destroy
    if @li.destroy
      flash[:notice] = "#{@li.product.name} has been deleted."
      redirect_to :back
    else
      flash[:alert] = "#{@li.product.name} could not be deleted."
    end
  end

  def position
    @li.product.category = @li.category = @category
    @li.update_attribute :position_position, params[:list_item][:position]
    @li.product.save
    render :nothing => true
  end

private

  def get_category
    @category = Category.find params[:list_item][:category_id]
  end

  def get_product
    product_name = params[:list_item].delete(:name)
    unless @product = @list.products.find_by_name(product_name)
      @product = @list.products.create({
        :name => product_name,
        :category => @category
      })
    end
  end

  def get_list
    @list = current_user.lists.find params[:list_id]
  end

  def get_list_item
    @li = @list.list_items.find params[:id]
  end

end




