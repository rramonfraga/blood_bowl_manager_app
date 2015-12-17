class SocietiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @societies = current_user.societies.order(:created_at)
  end

  def show
    if @society = Society.find_by(id: params[:id])
      @championships = @society.championships
    else
      render status: 404, file: '/public/404.html'
    end
  end

  def new
    @society = Society.new
  end

  def create
    @society = Society.new society_params
    unless @society.save
      render(:new)
    else
      current_user.societies << @society
      redirect_to(societies_path)
    end
  end

  private
  def society_params
    params.require(:society).permit(:name)
  end

end
