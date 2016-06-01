# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'craigslistpoetry-api'
set :repo_url, 'https://github.com/msquitieri/craigslistpoetry-api.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, :deployment

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/u/apps/craigslistpoetry-api_production/'

set :ssh_options, {
  forward_agent: true
}

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
set :default_env, { path: "/opt/rbenv/shims:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end
