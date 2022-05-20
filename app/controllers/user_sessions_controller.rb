class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to boards_path, flash: {notice: t('defaults.login') }
    else
      flash.now[:alert] = t('defaults.message.login_failed')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, alert: t('defaults.logout')
  end
end
