class Settings::AccountsController < Settings::BaseController

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      sign_in @user, :bypass => true
      flash[:notice] = 'Your password has been updated.'
      redirect_to settings_root_path
    else
      flash[:alert] = 'Unsuccessful. Please be sure your passwords match.'
      render 'edit'
    end
  end
end
