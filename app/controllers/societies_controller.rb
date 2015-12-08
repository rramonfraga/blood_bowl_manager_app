class SocietiesController < ApplicationController
  def index
    if current_user
      @societies = current_user.societies.order(:created_at)
    else
      redirect_to '/users/sign_in' 
    end
  end

end
