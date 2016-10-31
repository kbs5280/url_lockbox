class Api::V1::UrlsController < ApplicationController
  def index
    user_urls = Url.where(user_id: current_user.id).order(created_at: :desc)
    if user_urls
      respond_with user_urls
    end
  end

  def create
    url = Url.new(url_params)
    url[:user_id] = current_user.id
    if url.save
      respond_with(url, location: api_v1_urls_path)
    else
      respond_with url 
    end
  end

  private

    def url_params
      params.require(:url).permit(:title, :url, :read)
    end
end
