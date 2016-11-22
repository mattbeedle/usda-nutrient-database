class AddReferentialIntegrity < ActiveRecord::Migration
  def change
    remove_index :usda_nutrients, :nutrient_number
    add_index :usda_nutrients, :nutrient_number, unique: true

    remove_index :usda_source_codes, :code
    add_index :usda_source_codes, :code, unique: true

    remove_index :usda_food_groups, :code
    add_index :usda_food_groups, :code, unique: true

    remove_index :usda_foods, :nutrient_databank_number
    add_index :usda_foods, :nutrient_databank_number, unique: true

    add_index :usda_foods_nutrients, [
      :nutrient_databank_number,
      :nutrient_number
    ],
    unique: true,
    name: "index_usda_foods_nutrients_on_databank_number_and_number"

    add_foreign_key :usda_foods,
      :usda_food_groups,
      column: :food_group_code,
      primary_key: :code

    add_foreign_key :usda_foods_nutrients,
      :usda_foods,
      column: :nutrient_databank_number,
      primary_key: :nutrient_databank_number

    add_foreign_key :usda_foods_nutrients,
      :usda_nutrients,
      column: :nutrient_number,
      primary_key: :nutrient_number

    add_foreign_key :usda_foods_nutrients,
      :usda_source_codes,
      column: :src_code,
      primary_key: :code

    add_foreign_key :usda_footnotes,
      :usda_foods,
      column: :nutrient_databank_number,
      primary_key: :nutrient_databank_number

    add_foreign_key :usda_weights,
      :usda_foods,
      column: :nutrient_databank_number,
      primary_key: :nutrient_databank_number
  end
end
