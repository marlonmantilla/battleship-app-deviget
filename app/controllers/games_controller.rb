class GamesController < ApplicationController
  before_action :get_player, only: [:show, :ready]
  respond_to :js, only: [:ready]

  def index
    
  end

  def reset
    User.update_all(status: User::STATUS_PREPARING)
    User.all.each do |user|
      board = user.board
      board.reset_positions!
    end
    Attack.destroy_all
    redirect_to root_path
  end

  def show
    @board = @player.board
    @enemy = User.where.not(id: @player.id).first
  end

  def ready
    @player.status = User::STATUS_READY
    @player.save
  end

  private

  def get_player
    @player = User.find(params[:id])
  end

end
