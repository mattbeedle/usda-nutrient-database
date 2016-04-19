class FixUsdaFoodsNutrients < ActiveRecord::Migration
  def change
    remove_column :usda_foods_nutrients, :id

    change_table :usda_foods_nutrients do |t|
      t.remove_index [
        :nutrient_databank_number,
        :nutrient_number
      ]
    end
  end
end
