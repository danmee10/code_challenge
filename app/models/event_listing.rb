class EventListing < ActiveRecord::Base
  scope :tracks, -> { where("track LIKE 'Track%'") }
end
