include GeoKit::Geocoders

class Expense < ActiveRecord::Base
  attr_writer :tag_names
  attr_accessible :id, :description, :amount, :location

  has_many :tags, :through => :taggings
  has_many :taggings, :dependent => :destroy

  validates :location, :presence => true
#  validates :description, :presence => true
#  validates :amount, :presence => true

  before_save :geocode
  after_save :save_tags

  def tag_names  
    @tag_names || tags.map(&:name).join(' ')  
  end  
  
private

  def geocode
     coordinates = GoogleGeocoder.geocode(self.location)
     self.latitude = coordinates.lat
     self.longitude = coordinates.lng
  end 

  def save_tags
     if @tag_names  
       self.tags = @tag_names.split(' ').map do |name|  
         Tag.find_or_create_by_name(name)  
       end  
     end 
  end
end
