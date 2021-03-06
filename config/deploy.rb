# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, 'webjhl10'
set :repo_url, 'git@bitbucket.org:dvorak1/webjhl10.git'
set :deploy_via, :remote_cache
set :deploy_to, '/home/webjhl10'
set :use_sudo, false
set :rvm_type, :user
set :rvm_ruby_version, '2.6.5'
set :tmp_dir, "/home/webjhl10/.tmp"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
set :default_env, { rvm_bin_path: '~/.rvm/bin' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :deploy do
  task :update_jekyll do
    on roles(:app) do
      within "#{deploy_to}/current" do
        execute :bundle, "exec jekyll build"
      end
    end
  end

  after "deploy:symlink:release", "deploy:update_jekyll"
end
