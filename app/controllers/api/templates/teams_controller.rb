class Api::Templates::TeamsController < ApplicationController
  def index
    @team = Templates::Team.all
    #render json: @teams
  end

  def show
    @team = Templates::Team.find_by id: params[:id]
    #render json: @team
  end
end
