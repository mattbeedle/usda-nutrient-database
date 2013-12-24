class CreateUsdaWeights < ActiveRecord::Migration
  def change
    create_table :usda_weights do |t|
      t.string  :nutrient_databank_number, null: false, index: true
      t.string  :sequence_number, null: false
      t.float   :amount, null: false
      t.string  :measurement_description, null: false
      t.float   :gram_weight, null: false
      t.integer :num_data_points
      t.float   :standard_deviation
    end
  end
end
