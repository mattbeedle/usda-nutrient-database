class AddTimestampsToAllTables < ActiveRecord::Migration
  def change
    [
      :usda_food_groups, :usda_foods, :usda_foods_nutrients,
      :usda_weights, :usda_footnotes, :usda_source_codes,
      :usda_nutrients
    ].each do |table_name|
      add_column table_name, :created_at, :datetime
      add_column table_name, :updated_at, :datetime
    end
  end
end
