require "rails_helper"

RSpec.describe SkillsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/skills").to route_to("skills#index")
    end

    it "routes to #show" do
      expect(:get => "/api/skills/1").to route_to("skills#show", :id => "1")
    end

  end
end
