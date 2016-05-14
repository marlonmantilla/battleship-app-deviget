require 'rails_helper'

RSpec.describe Attack, type: :model do
  
  it{ should validate_presence_of :user }
  it{ should validate_presence_of :attacker }
  it{ should validate_presence_of :coor_x }
  it{ should validate_presence_of :coor_y }
  it{ should belong_to :user }
  it{ should belong_to :attacker }


  describe "Validations" do 
    let(:user){ FactoryGirl.create(:user, name: "Player 1") }
    let!(:attacker){ FactoryGirl.create(:user, name: "Player 2") }
    let!(:board){ FactoryGirl.create(:board, user: user, positions: {c: [2,3,4]}) }
    let!(:attack){ FactoryGirl.create(:attack, user: user, attacker: attacker, coor_x: "c", coor_y: 2) }

    let(:user2){ FactoryGirl.create(:user, name: "Player 3") }
    let!(:board_2){ FactoryGirl.create(:board, user: user2, positions: {c: [2,3,4]}) }
    let!(:board){ FactoryGirl.create(:board, user: user, positions: {c: [2,3,4]}) }

    it 'should not attack twice on the same position' do
      attack = attacker.user_attacks.build(user: user, coor_x: "c", coor_y: 2)
      expect(attack).to_not be_valid

      attack = attacker.user_attacks.build(user: user2, coor_x: "c", coor_y: 2)
      expect(attack).to be_valid
    end

  end

end
