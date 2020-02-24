class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :name
      t.integer :true_to_size_data
      t.float :true_to_size_calculation
      t.timestamps
    end
  end
end
