class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    flickr = Flickr.new(Rails.application.credentials.flickr[:key], Rails.application.credentials.flickr[:secret])
    if params[:flickr_id].present?  # If user_id is present, get the user's photos
      @photos = flickr.photos.search(user_id: params[:flickr_id])
    else # Otherwise, get the public photos
      @photos = flickr.photos.getRecent
    end
  end
end
