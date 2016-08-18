class CommunitiesController < ApplicationController
  before_action :authenticate_user!

  def show
    if @community = Community.find_by(id: params[:community_id])
      @championships = @community.championships
    else
      render status: 404, file: '/public/404.html'
    end
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new community_params
    unless @community.save
      render(:new)
    else
      current_user.communities << @community
      redirect_to(communities_path(@community))
    end
  end

  private
  def community_params
    params.require(:community).permit(:name)
  end

end
