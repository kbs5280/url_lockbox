class Api::V1::UnreadUrlsController < ApplicationController
  def index
    user_unread_urls = Url.where(user_id: current_user.id, read: false).order(created_at: :desc)
    if user_unread_urls
      respond_with user_unread_urls
    end
  end
end
