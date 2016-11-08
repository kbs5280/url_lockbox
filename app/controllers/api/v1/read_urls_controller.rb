class Api::V1::ReadUrlsController < ApplicationController
  def index
    user_read_urls = Url.where(user_id: current_user.id, read: true).order(created_at: :desc)
    if user_read_urls
      respond_with user_read_urls
    end
  end
end
