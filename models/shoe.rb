class Shoe < ActiveRecord::Base
    serialize :true_to_size_data, Array
    after_create :set_initial_fit

    #validates_each :true_to_size
    validates :name, uniqueness: true

    def fit
        self.true_to_size_calculation
    end

    def calcuate_true_fit
        self.true_to_size_calculation = self.true_to_size_data.sum.to_f/true_to_size_data.length
    end 

    def update_fit(fit)
        true_to_size_data << fit
        calcuate_true_fit
    end

    def set_initial_fit
        self.true_to_size_data << self.true_to_size_calculation if true_to_size_calculation && !true_to_size_data.empty?
    end




end