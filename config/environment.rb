require 'dotenv/load'
ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require './models/shoe.rb' #ToDo 


#set :database_file, 'database.yml'
