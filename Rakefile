#require 'sinatra/activerecord'
#require './config/database.yml'
ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
#require './app'


namespace :db do
    task :load_config do
        require "./app"
    end
end