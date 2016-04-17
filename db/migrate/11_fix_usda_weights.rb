class FixUsdaWeights < ActiveRecord::Migration
  def change
    remove_column :usda_weights, :id

    change_table :usda_weights do |t|
      t.remove_index :nutrient_databank_number

      t.index [
        :nutrient_databank_number,
        :sequence_number
      ], {
        unique: true
      }
    end
  end
end
