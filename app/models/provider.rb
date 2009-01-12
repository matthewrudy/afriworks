class Provider < ActiveRecord::Base
  validates_presence_of :name, :description, :location
  has_many :testimonials

  has_attached_file :image, :styles => { :large => "800x500>", :medium => "500x300>", :thumb => "200x150>" }
  def image_present?
    image_file_name?
  end
  
  def legacy_image_url(size)
    image_present? ? image.url(size) : image_url
  end
end
