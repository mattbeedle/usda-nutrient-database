class FixUsdaFoodsNutrients < ActiveRecord::Migration
  def change
    remove_column :usda_foods_nutrients, :id

    change_table :usda_foods_nutrients do |t|
      t.remove_index name: 'index_usda_foods_nutrients_on_databank_number_and_number'
    end
  end
end
