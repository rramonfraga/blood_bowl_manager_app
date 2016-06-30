class Api::Templates::SkillsController < ApplicationController
  
  def index
    @skills = Templates::Skill.all
    #render json: @skills
  end

  def show
    @skill = Templates::Skill.find_by id: params[:id]
    #render json: @skill
  end

end
