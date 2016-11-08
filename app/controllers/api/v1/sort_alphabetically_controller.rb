class Api::V1::SortAlphabeticallyController < ApplicationController
  def index
    alphabetical_urls = Url.where(user_id: current_user.id).order(title: :asc)
    if alphabetical_urls
      respond_with alphabetical_urls
    end
  end
end
