class Api::V1::TagsController < ApplicationController

  def create
    url = Url.find(params[:url][:urlId])
    tags = params[:url][:tags]
    tags.split(',').map do |tag|
      url.tags.create(name: tag)
    end
    respond_with(tags, location: api_v1_urls_path)
  end
end
