# config valid only for current version of Capistrano
lock '3.10.0'

set :application, 'craigslistpoetry-api'
set :repo_url, 'https://github.com/msquitieri/craigslistpoetry-api.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, :master

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
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/smtp.yml', 'config/twitter.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
set :default_env, { path: "/opt/rbenv/shims:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  task :restart_unicorn do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      if test("[ -f #{current_path}/tmp/pids/unicorn.pid ]")
        execute "kill -QUIT `cat #{current_path}/tmp/pids/unicorn.pid`"
      end

      execute "cd #{current_path} ; /opt/rbenv/shims/bundle exec unicorn -c /u/apps/craigslistpoetry-api_production/shared/config/unicorn.rb -E production -D"
    end
  end

  after :finished, :restart_unicorn
end
