class StaticPage < ActiveRecord::Base
  acts_as_list
  default_scope :order => "position"

  named_scope :published, :conditions => {:published => true}
  
  before_create :set_short_name

  def set_short_name
    self.short_name = linkify(self.title)
  end

  def linkify(string)
    string.gsub(/\W/, " ").strip.titleize.gsub(/ +/, "-") if string
  end
end
