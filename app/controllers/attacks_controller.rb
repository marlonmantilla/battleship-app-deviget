class AttacksController < ApplicationController

  respond_to :js

  def create
    @attacker = User.find(params[:game_id])
    @coor_x = attack_params[:coor_x]
    @coor_y = attack_params[:coor_y]
    @attack = @attacker.user_attacks.build(attack_params)
    @attack.save
  end

  private 

  def attack_params
    params.require(:attack).permit(:coor_x, :coor_y, :user_id)
  end


end
