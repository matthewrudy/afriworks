class StaticPage < ActiveRecord::Base
  before_save :set_short_name

  def set_short_name
    self.short_name = linkify(self.title)
  end

  def linkify(string)
    string.gsub(/\W/, " ").strip.titleize.gsub(/ +/, "-") if string
  end
end
