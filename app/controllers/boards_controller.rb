class BoardsController < ApplicationController
  skip_before_action :require_login, only: %i[new create index]
  def new
    @board = Board.new
  end

  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to 
    end
  end


  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to @board
    else
      render :edit
    end
  end
  
  
  def show
    @board = Board.find(params[:id])
  end
  
  def destroy

  end

  private

  def board_params
    params.require(:board).permit(:title,:incident)
  end
end
