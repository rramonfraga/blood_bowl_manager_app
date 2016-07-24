class Api::Templates::SkillsController < ApplicationController
  
  def index
    skills = ::Templates::Skill.all
    render json: skills, each_serializer: Api::Templates::SkillSerializer
  end

  def show
    skill = ::Templates::Skill.find_by id: params[:id]
    render json: skill, serializer: Api::Templates::SkillSerializer
  end

end
