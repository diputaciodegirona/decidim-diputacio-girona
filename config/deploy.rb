# config valid only for current version of Capistrano
lock "3.11.0"

set :application, "decidim-diputacio-girona"
set :repo_url, "https://github.com/diputaciodegirona/decidim-diputacio-girona.git"

set :git_http_username, "ddgi-desenvolupament"

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
append :linked_files, "config/application.yml", "config/puma.rb"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/uploads", "storage", "tmp/webpacker-cache", "node_modules", "public/decidim-packs"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :use_sudo, false

# Before / After Hooks
after "deploy:restart", "deploy:cleanup" # clean old releases

namespace :deploy do
  desc "Decidim webpacker configuration"
  task :decidim_webpacker_install do
    on roles(:all) do
      within release_path do
        execute :npm, "install"
      end
    end
  end

  before "deploy:assets:precompile", "deploy:decidim_webpacker_install"
end
