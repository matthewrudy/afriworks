if File.exist?(File.join(Rails.root, "REVISION"))
  ENV["RAILS_APP_VERSION"] = File.open(File.join(Rails.root, "REVISION")).read.strip
end