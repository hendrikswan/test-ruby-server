require 'fileutils'
# config valid only for current version of Capistrano
lock "3.8.1"


set :application, "test_aws_setup"
set :repo_url, 'https://github.com/hendrikswan/test-ruby-server'

set :ssh_options, {
  user: 'ec2-user',
  forward_agent: true,
  proxy: Net::SSH::Proxy::Command.new("ssh -p 41436 ec2-user@34.249.59.48 -W %h:%p"),
}

set :ssh_options, {:auth_methods => "publickey"}
set :ssh_options, {:keys => ["~/Downloads/hendrik_se_kafka_cluster.pem"]}


SSHKit::Backend::Netssh.pool.idle_timeout = 120

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
set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  # task :ensure_folders
  #   on roles(:app) do
  #     # invoke 'unicorn:restart'
  #     FileUtils::mkdir_p 'tmp/sockets'
  #     FileUtils::mkdir_p 'tmp/pids'
  #   end    
  # end 

  task :restart do
    puts 'after publishing'

    # execute "devops/scripts/sidekiq.start.rb"

    # on roles(:app) do
    #   invoke 'unicorn:restart'
    # end

    # if ENV['SERVICE'] == 'core'
    #   invoke 'sidekiq_scripted:restart'
    # else
    #   on roles(:sidekiq) do
    #     invoke 'sidekiq:rolling_restart'
    #   end
    # end
  end
end