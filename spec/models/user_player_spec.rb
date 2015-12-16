require 'rails_helper'

RSpec.describe UserPlayer, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user_player)).to be_valid
  end
end
