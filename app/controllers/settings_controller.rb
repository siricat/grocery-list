class SettingsController < ApplicationController

  def index
  end

  def password
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      sign_in @user, :bypass => true
      flash[:notice] = 'Your password has been updated.'
      redirect_to settings_path
    else
      flash[:alert] = 'Unsuccessful. Please be sure your passwords match.'
      render 'password'
    end
  end
end
