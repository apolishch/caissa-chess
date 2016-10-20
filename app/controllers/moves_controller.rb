class MovesController < ApplicationController
  before_action :authenticate_user!, only: [:make_move]

  respond_to :json

  def make_move 
    @piece = Piece.find_by_id(params[:piece_id])
    
    render json: {
      game: @piece.game.update_with_piece(@piece.move(params[:x]), params[:y])
    } if @piece.valid_move?
    render json {invalid: true} if !@piece.valid_move?
  end
end
