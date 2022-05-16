class ApplausersController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    current_user.applauser(@board)
  end

  def destroy
    @board = current_user.applausers.find(params[:id]).board
    current_user.noapplauser(@board)
  end
end
