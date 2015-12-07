require 'rails_helper'

RSpec.describe "Skill", type: :request do
  before { Skill.create name: 'Block',
                        category: 'General',
                        description: 'A player with the Block skill is proficient at knocking opponents down. The Block skill, if used, affects the results rolled with the Block dice, as explained in the Blocking rules.'}


  describe "GET /api/skills" do
    before { Skill.create name: 'Pass',
                        category: 'Passing',
                        description: 'A player with the Pass skill is allowed to re-roll the D6 if he throws an inaccurate pass or fumbles.'}

    it "return a list of skills" do
      get "/api/skills"
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data.length).to eq(2)
    end
  end

  describe "GET /api/skills/:id" do
    it "return the first skill" do  
      get "/api/skills/1"
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data["name"]).to eq("Block")
    end

    it "return and error when there aren't skill" do
      get "/api/skills/5000000"
      data = JSON.parse(response.body)

      expect(response).to have_http_status(404)
    end
  end

end