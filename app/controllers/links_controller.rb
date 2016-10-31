class LinksController < ApplicationController
  def new
    require "pry"; binding.pry
    @url = Url.new
  end

  def index
    if current_user
    else
      redirect_to dashboard_path
    end
  end
end
