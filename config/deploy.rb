set :application, "bottom"
set :repository,  "git@matthewrudy.com:bottombillion.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true


role :app, "bottom.matthewrudy.com"
role :web, "bottom.matthewrudy.com"
role :db,  "bottom.matthewrudy.com", :primary => true

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
