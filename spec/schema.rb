ActiveRecord::Schema.define version: 0 do
  create_table :usda_food_groups, force: true, primary_key: :code, id: false do |t|
    t.string :code, null: false, index: true, unique: true
    t.string :description, null: false
  end

  create_table :usda_foods, force: true, primary_key: :code, id: false do |t|
    t.string  :nutrient_databank_number, null: false, index: true
    t.string  :food_group_code, index: true
    t.string  :long_description, null: false
    t.string  :short_description, null: false
    t.string  :common_names
    t.string  :manufacturer_name
    t.boolean :survey
    t.string  :refuse_description
    t.integer :percentage_refuse
    t.float   :nitrogen_factor
    t.float   :protein_factor
    t.float   :fat_factor
    t.float   :carbohydrate_factor
  end
end
