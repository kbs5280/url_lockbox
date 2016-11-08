class Api::V1::AssociatedTagsController < ApplicationController
  def index
    associated_tags = Url.where(tag: params[:url][:tag])
    if associated_tags
      respond_with associated_tags
    end
  end
end
