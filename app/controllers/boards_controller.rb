class BoardsController < ApplicationController

  def set_ship
    @board = Board.find(params[:id])
    p ship_position
    @board.add_ship!(ship_position)
    render json: {message: "Ship saved!"}, status: :ok
    
  end

  def ship_position
    position = {}
    params[:position].each do |k, v|
      if v.index(",")
        values = v.split(',').map{|i| i.to_i }
      else
        values = v.to_i
      end
      position[k] = values
    end
    position
  end

end
