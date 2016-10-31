class LinksController < ApplicationController
  def index
    if current_user
    else
      redirect_to dashboard_path
    end
  end
end
