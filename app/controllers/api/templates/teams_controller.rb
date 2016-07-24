class Api::Templates::TeamsController < ApplicationController
  def index
    @teams = ::Templates::Team.all
    render json: @teams, each_serializer: Api::Templates::TeamSerializer
  end

  def show
    team = ::Templates::Team.find_by id: params[:id]
    render json: team, serializer: Api::Templates::TeamSerializer
  end
end
