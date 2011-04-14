include GeoKit::Geocoders

class Expense < ActiveRecord::Base
  attr_accessible :id, :description, :amount, :location

  validates :location, :presence => true
  validates :description, :presence => true
  validates :amount, :presence => true

  before_save :geocode
  
private

  def geocode
     coordinates = GoogleGeocoder.geocode(self.location)
     self.latitude = coordinates.lat
     self.longitude = coordinates.lng
  end 
end
