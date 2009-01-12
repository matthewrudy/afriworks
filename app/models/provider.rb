class Provider < ActiveRecord::Base
  validates_presence_of :name, :description, :location
  has_many :testimonials

  has_attached_file :image, :styles => { :medium => "500x300>", :thumb => "200x150>" }

end
