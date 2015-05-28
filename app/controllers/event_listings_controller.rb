class EventListingsController < ApplicationController

  def index
    @track_headers = EventListing.tracks.group('track')
    @times = [EventListing.pluck(:start) + EventListing.pluck(:finish)].flatten.uniq.sort
  end
end
