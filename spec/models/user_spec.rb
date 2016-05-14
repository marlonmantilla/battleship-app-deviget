require 'rails_helper'

RSpec.describe User, type: :model do
  
  it{ should validate_presence_of :name }
  it{ should validate_inclusion_of(:status).in_array(User::STATUSES) }

  describe ".ready?" do
    let(:user){ FactoryGirl.create(:user, name: "Player 1", status: User::STATUS_READY) }
    it 'should return true when status is ready' do
      expect(user.ready?).to eql true
    end
  end

end
