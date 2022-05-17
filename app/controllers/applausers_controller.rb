class ApplausersController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    current_user.applauser(@board)
    @applauser_count = Applauser.where(board_id: params[:board_id]).count
  end

  def destroy
    @board = current_user.applausers.find(params[:id]).board
    current_user.noapplauser(@board)
    @applauser_count = Applauser.where(board_id: params[:board_id]).count
  end
end
