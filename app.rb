
require 'sinatra'
#require 'sinatra/activerecord'
#require './config/environment.rb'
#require './models/shoe.rb'
#set :database_file, 'config/database.yml'

#before do 
#  content_type :json
#end


get '/hello-world' do
  "Hello World!"
end
#get '/' do
#  "poop"
#end

get '/fit/:name' do
  #@shoe = Shoe.where(:name => params['name'])
  #@shoe.fit_data if @shoe
  {shoe: hi, fit: 1}
end

post '/fit/:name/:fit' do
   # @shoe = Shoe.where(:name => params['name']).first_or_create
   # @shoe.update_fit(params[:fit])
  #  @shoe.save
   # @shoe.fit_data
    {cats: "meow"}
end

after do
  response.body = JSON.dump
end
