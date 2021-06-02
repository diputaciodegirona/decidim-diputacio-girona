set :stage, 'staging'
set :branch, 'master'

server 'SERVER', user: 'USER', port: '22', roles:  %w{app web db}
set :deploy_to, "PATH/TO/DEPLOY" # directory for the project in the server, in this case 'var/www/customers'

set :rbenv_type, :user
set :rbenv_ruby, '2.6.6'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails puma pumactl}
set :rbenv_roles, :all # default value
set :keep_releases, 5

# set :puma_state, "#{shared_path}/tmp/pids/puma.state"
# set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
# set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_conf, "#{shared_path}/config/puma.rb"

