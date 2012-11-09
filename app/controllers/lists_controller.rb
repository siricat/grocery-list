class ListsController < ApplicationController

  def index
    @lists = current_user.lists
  end

  def show
    @list = current_user.lists.find params[:id]
    @li = ListItem.new
    @categories = Category.all
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.owned_lists.new params[:list]

    if @list.save
      flash[:notice] = "#{@list.name} was created."
      redirect_to list_path(@list)
    else
      flash[:alert] = "There was a problem creating #{@list.name}."
      redirect_to :back
    end
  end


  def edit
    @list = List.find params[:id]
  end

  def update
    @list = List.find params[:id]

    if @list.update_attributes params[:list]
      flash[:notice] = "#{@list.name} was updated."
      redirect_to lists_path
    else
      flash[:alert] = "#{@list.name} was not updated."
      redirect_to :back
    end
  end


  def destroy
    @list = List.find params[:id]

    if @list.destroy
      flash[:notice] = "#{@list.name} has been deleted."
    else
      flash[:alert] = "#{@list.name} could not be deleted."
    end

    redirect_to lists_path
  end


end
