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

  def show_by_category
    skills = Skill.return_skill_with(params[:category])
    if skills
      render status: 200, json: skills
    else
      render status: 404, json: { errors: "skills not found" }
    end
  end
end
