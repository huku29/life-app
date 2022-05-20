class BoardsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @board = Board.new
  end

  def index
    @boards = Board.all.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to @board, notice: t('defaults.message.new')
    end
  end

  def mypage
    @boards = Board.where(user_id: current_user).order(created_at: :desc).page(params[:page])
    if @boards.empty?
      redirect_to new_board_path, flash: {alart: '投稿していません'} 
    end
  end
  


  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to @board, notice: t('defaults.message.updated', item: Board.model_name.human)
    else
      flash.now[:alart] = t('defaults.message.edit_failed')
      render :edit
    end
  end
  
  
  def show
    @board = Board.find(params[:id])
  end
  
  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy
    redirect_to boards_path, flash: {alart: t('defaults.message.deleted', item: Board.model_name.human) } 
  end

  private

  def board_params
    params.require(:board).permit(:title,:incident)
  end
end
