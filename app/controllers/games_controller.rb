class GamesController < ApplicationController
  before_action :get_player, only: [:show, :ready]
  respond_to :js, only: [:ready]

  def index
    
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
