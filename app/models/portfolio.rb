class Portfolio < ActiveRecord::Base
  has_attached_file :example, :styles => { :large => "800x500>", :medium => "500x300>", :thumb => "200x150>" }

  belongs_to :provider
end
