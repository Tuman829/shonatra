#require 'spec_helper.rb'
RSpec.describe Shoe, type: :model do
    describe "Instance Methods" do
      describe "trueToSize" do
        it "takes in size data and returns the calculation" do
          @shoe = Shoe.create(name: "adidas Yeezy")
          crowd_sourced_data = [1, 2, 2, 3, 2, 3, 2, 2, 3, 4, 2, 5, 2, 3, 2] #ToDo create a random array and test that way. 
          crowd_sourced_data.each do |fit|
             @shoe.update_fit(fit)
          end 
          average = crowd_sourced_data.sum.to_f/crowd_sourced_data.length
          puts average
          expect(@shoe.true_to_size_calculation).to eq(average)
        end
      end
    end
  end

  #2.533333333333
  #0.000000000000