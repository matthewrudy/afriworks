class Provider < ActiveRecord::Base
  validates_presence_of :name, :description, :image_url, :location
  has_many :testimonials
end
