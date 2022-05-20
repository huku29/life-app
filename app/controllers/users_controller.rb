class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: t('defaults.message.register_success')
    else
      flash.now[:alert] = t('defaults.message.register_failed')
      render action: :new
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
