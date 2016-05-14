require 'rails_helper'

RSpec.describe Board, type: :model do
  
  it{ should validate_presence_of :user }

  describe "Validations" do
    let(:user){ FactoryGirl.create(:user, name: "Player 1") }
    let!(:board){ FactoryGirl.create(:board, user: user, positions: {c: [2,3,4]}) }

    it 'should not allow to place more than one ship in the same position' do
      expect{board.add_ship!({"c" => 4, "d" => 4, "e" => 4 })}.to raise_error
      expect(board.reload.positions).to eq({"c" => [2,3,4]})
    end

    it 'should add ship when valid' do
      expect{board.add_ship!({"a" => [1,2,3] })}.to_not raise_error
      expect(board.reload.positions).to eq({"c"=>[2, 3, 4], "a"=>[1, 2, 3]})
    end
  end

  describe ".attacked?" do
    let(:user){ FactoryGirl.create(:user, name: "Player 1") }
    let!(:attacker){ FactoryGirl.create(:user, name: "Player 2") }
    let!(:board){ FactoryGirl.create(:board, user: user, positions: {c: [2,3,4]}) }

    it 'should return true if position was compromised' do
      FactoryGirl.create(:attack, user: user, attacker: attacker, coor_x: "c", coor_y: 2)
      expect(board.attacked?("c", 2)).to eql true
    end
  end

  describe ".ship_positioned?" do
    let(:user){ FactoryGirl.create(:user, name: "Player 1") }
    let!(:board){ FactoryGirl.create(:board, user: user, positions: {c: [2,3,4]}) }

    it 'should return true if user ship is in position' do 
      expect(board.ship_positioned?("c", 3)).to eql true
    end
  end

end
