require 'rails_helper'

RSpec.describe UserPlayer, type: :model do

  describe 'correct validations for the atributtes' do
    it "has a valid factory" do
      expect(FactoryGirl.create(:user_player)).to be_valid
    end
    it "is invalid without a user_name" do
      expect(FactoryGirl.build(:user_player, user_name: nil)).to_not be_valid
    end
    it "is invalid without a dorsal_number" do
      expect(FactoryGirl.build(:user_player, dorsal_number: nil)).to_not be_valid
    end
  end

  descibe 'assign_stats_from_the_template' do
    it "returns a contact's full name as a string" do
      player = FactoryGirl.build(:user_player, dorsal_number: 1, user_name: "John", template_player_id: 1)
      player.assign_stats_from_the_template
      expect(self.title).to ()
    end
    
  end
end
