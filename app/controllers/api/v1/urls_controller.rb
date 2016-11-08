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

  def update
    url = Url.find(params[:id])
    url.update_attribute(:read, params[:url][:read]) if params[:url][:read]
    url.update_attribute(:title, params[:url][:title]) if params[:url][:title]
    url.update_attribute(:url, params[:url][:url]) if params[:url][:url]
    url.update_attribute(:tag, params[:url][:tag]) if params[:url][:tag]
    if url.save
      respond_with(url, location: api_v1_urls_path)
    else
      respond_with url
    end
  end

  def destroy
    Url.destroy(params[:id])
  end

  private

    def url_params
      params.require(:url).permit(:title, :url, :read)
    end
end
