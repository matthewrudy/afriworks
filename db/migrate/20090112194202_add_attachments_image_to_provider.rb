require 'open-uri'
class AddAttachmentsImageToProvider < ActiveRecord::Migration
  class Provider < ActiveRecord::Base
    has_attached_file :image, :styles => { :medium => "500x300>", :thumb => "200x150>" }
  end

  def self.up
    add_column :providers, :image_file_name, :string
    add_column :providers, :image_content_type, :string
    add_column :providers, :image_file_size, :integer
    add_column :providers, :image_updated_at, :datetime
    
    # convert any existing image_urls
    Provider.all.each do |provider|
      next unless provider.image_url.blank?
      begin
        image = open(provider.image_url)
        provider.image = image
        provider.save(false)
      rescue
      end
    end
  end

  def self.down
    remove_column :providers, :image_file_name
    remove_column :providers, :image_content_type
    remove_column :providers, :image_file_size
    remove_column :providers, :image_updated_at
  end
end
