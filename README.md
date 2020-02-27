
# Shonatra

As noted in my communication: Due to quirks in my local system (WSL) and the framework I used, I hit a blocker with the last bugs and final touches on the functionality (Docker Desktop is not available for my OS).  The app differently on Heroku, but it would not be timely to debug it in the cloud). 

## Design
I wrote this in Sinatra (the ruby framework that Express.js is based on). The structure had three major parts. 
- A `Shoe` class that stores an `name (string)`, `true_to_size_data (serialized array of integers)`, and `true_to_size_calculation (float)`. It relies on the ActiveRecord ruby gem (the ORM that inspired Sequelize) to gain migrations, easy DB search, and validations. 
- An `app.rb` that handles routes and responses. It includes:
	-  `Get` endpoint, `/fit/{name}`, which returns the shoe fit data in Json (the `true_to_size_calculation` ) if the shoe is present.
	- `Post` endpoint,  `/fit/{name}/{fit}` which updates a shoe's `true_to_size_calculation` if the name matches and creates a new shoe with that data if it does not exist in the DB. It also returns the shoe's fit data. 

- A test spec based on rspec in the `spec` folder: 
	 - `models/shoe_spec.rb`  tests the `shoe` model creation, adding fit data, and returning that data accurately. 
	 - `requests/fit_spec.rb` Tests the endpoints: Creating a shoe, getting info on a show, and updating a shoe. 

- The  `DB`, `config.ru`, and `config` files/folders provide the configuration for the app, connect the various parts and set the DB. 

## Running the app. 
Prerequisites:
	- Launch a postgres server. 
	- Run the `bundle` command to install ruby gems.
	- Run the `rake db:create` and `rake db:migrate` commands to configure the database. 
	
The command to locally launch server is `bundle exec rackup config.ru -p {port}` where `{port}` is the desired post. 

The `Rspec` command will launch the test suite

## Other notes
Given that my local environment was not clashing with Sinatra, I would have moved on to do the following. 
1. Confirm the validity of the code I had so far 
2. Add additional validations (ensure that fit data can only be 1-5) and more proper error handling. (Expanding the test suite as I did so)
3. Add Dockerfile that covered the steps mentioned in the prerequisite section and mounted the Heroku AWS variable as volume  
4. Added monitoring to my Heroku environment. 

