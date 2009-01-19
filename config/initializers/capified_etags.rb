# when we deploy via :capistrano and :git
# it builds us /current/REVISION with a hash of the latest commit
# (similarly for :svn and :export)
app_version_path = File.join(Rails.root, "REVISION")
if File.exist?(app_version_path)
  ENV["RAILS_APP_VERSION"] = File.open(app_version_path).read.strip
end