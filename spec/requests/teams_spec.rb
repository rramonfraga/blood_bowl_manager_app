require 'rails_helper'

RSpec.describe "Team", type: :request do
  before { Team.create  name: 'Dwarf',
                        reroll_value: 50000,
                        description: 'Dwarfs seem to be ideal Blood Bowl players, being compact, tough, well-armoured and having a stubborn knack of refusing to die! Most successful Dwarf teams work to the principle that if they can take out all the other team’s potential scorers, and wear down the rest, then there won’t be anybody left to stop them scoring the winning touchdowns!',
                        stakes: false, 
                        revive: '',
                        apothecary: true  }


  describe "GET /api/teams" do
    before { Team.create  name: 'Elf',
                          reroll_value: 50000,
                          description: 'When the NAF collapsed, many Elven teams were left penniless. Those teams that have survived the fallout are not as rich as the High Elf teams nor as well equipped, but they sure know how to play the game. Sporting facemasks and mohawks, they take to the pitch to relive the glory days they once played in.',
                          stakes: false, 
                          revive: '',
                          apothecary: true  }

    it "return a list of teams" do
      get "/api/teams"
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data.length).to eq(2)
    end
  end

  describe "GET /api/teams/:id" do
    it "return the first team" do  
      get "/api/teams/1"
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data["name"]).to eq("Dwarf")
    end

    it "return and error when there aren't team" do
      get "/api/teams/5000000"
      data = JSON.parse(response.body)

      expect(response).to have_http_status(404)
    end
  end

end