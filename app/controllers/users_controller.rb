class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user= User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: '新規登録完了'
    else
      flash.now[:danger] = '登録失敗'
      render action: :new
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
