require "capistrano/setup"
require "capistrano/deploy"

require 'capistrano/rails'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/nginx'
require 'capistrano/puma'
install_plugin Capistrano::Puma
require 'capistrano/puma/nginx'
require 'capistrano/sidekiq'
require 'sshkit/sudo'

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
