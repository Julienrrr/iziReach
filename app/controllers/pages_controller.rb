class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @home = true
  end

  def dashboard
    if current_user.company
      redirect_to company_path(current_user.company)
    elsif current_user.influencer
      redirect_to solicitations_path
    else
      @home = true
      render :home
    end
  end
end
