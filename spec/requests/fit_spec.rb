require 'spec_helper'

RSpec.describe "/fit", type: :request do

  it "poops" do
    get '/'
    raise last_response
    expect(last_response.status).to be(400)
  end


  it "creates a shoe" do
    headers = {
      "ACCEPT" => "application/json",     # a is what Rails 4 accepts
     # "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
    post "/fit", :params =>  {:name => "Clog", :fit => 1} #, :headers => headers
    #post "/widgets", :params => '{ "widget": { "name":"My Widget" } }', :headers => headers
    #To do add database step?
    #model spec
    expect(last_response.status).to be(200)
  end

  it "recieves shoe info" do
    headers = {
        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
       # "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      yeezy = Shoe.create(name: "adidas Yeezy", true_to_size_calculation: 1)
      get "/fit", :params =>{:name => "adidas Yeezy"} #, :headers => headers
      #raise response.body 
      raise last_response.body
      expect(last_response).to include_json(
        name: "adidas Yeezy",
        fit: 1
      )
  end

  it "updates fit info" do
   # headers = {
   #     "ACCEPT" => "application/json",     # This is what Rails 4 accepts
       # "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
     # }
      yeezy = Shoe.create(name: "adidas Yeezy", true_to_size_calculation: 1)
      post "/fit", :params => { :shoe => {:name => "adidas Yeezy", :fit => 3} }#, :headers => headers
      #raise response.body 
      raise last_response.body
      expect(last_response).to include_json(
        name: "adidas Yeezy",
        fit: 2
      )
  end

  #TD add est to test change 



end