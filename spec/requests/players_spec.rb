require 'rails_helper'

RSpec.describe "Player", type: :request do
  before {  dwarfs = Team.create  name: 'Dwarf',
                                  reroll_value: 50000,
                                  description: 'Dwarfs seem to be ideal Blood Bowl players, being compact, tough, well-armoured and having a stubborn knack of refusing to die! Most successful Dwarf teams work to the principle that if they can take out all the other team’s potential scorers, and wear down the rest, then there won’t be anybody left to stop them scoring the winning touchdowns!',
                                  stakes: false, 
                                  revive: '',
                                  apothecary: true  
            block = Skill.create  name: 'Block',
                                  category: 'General',
                                  description: 'A player with the Block skill is proficient at knocking opponents down. The Block skill, if used, affects the results rolled with the Block dice, as explained in the Blocking rules.'
            tackle = Skill.create   name: 'Tackle',
                                    category: 'General',
                                    description: 'Opposing players who are standing in any of this player’s tackle zones are not allowed to use their Dodge skill if they attempt to dodge out of any of the player’s tackle zones, nor may they use their Dodge skill if the player throws a block at them and uses the Tackle skill.'
            thick_skull = Skill.create  name: 'Thick Skull',
                                        category: 'Strength',
                                        description: 'This player treats a roll of 8 on the Injury table, after any modifiers have been applied, as a Stunned result rather than a KO’d result. This skill may be used even if the player is Prone or Stunned.'
            blocker = dwarfs.players.create quantity: 2, 
                                            title: 'Blocker', 
                                            cost: 70000,
                                            ma: 4, 
                                            st: 3,
                                            ag: 2, 
                                            av: 9,
                                            normal: 'GS',
                                            double: 'AP',
                                            feeder: false
            blocker.skills << block
            blocker.skills << tackle
            blocker.skills << thick_skull
          }


  describe "GET /api/players" do

    it "return a list of players" do
      get "/api/players"
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data.length).to eq(1)
    end
  end

  describe "GET /api/players/:id" do
    it "return the first player" do  
      get "/api/players/1"
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data["title"]).to eq("Blocker")
    end

    it "return and error when there aren't player" do
      get "/api/players/5000000"
      data = JSON.parse(response.body)

      expect(response).to have_http_status(404)
    end
  end

end