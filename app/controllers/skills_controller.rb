class SkillsController < ApplicationController

  def index
    skills = Skill.all
    render status: 200, json: skills
  end

  def show
    skill = Skill.find_by id: params[:id]
    if skill
      render status: 200, json: skill
    else
      render status: 404, json: { errors: "skill not found" }
    end
  end

end
