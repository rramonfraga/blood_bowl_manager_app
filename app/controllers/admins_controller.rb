class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @championships = current_community.championships
    @users = current_community.users
  end


end