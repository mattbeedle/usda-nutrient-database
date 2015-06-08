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
    t.string  :scientific_name
    t.float   :nitrogen_factor
    t.float   :protein_factor
    t.float   :fat_factor
    t.float   :carbohydrate_factor
  end

  create_table :usda_nutrients, force: true, primary_key: :nutrient_number, id: false do |t|
    t.string  :nutrient_number, null: false, index: true
    t.string  :units, null: false
    t.string  :tagname
    t.string  :nutrient_description, null: false
    t.string  :number_decimal_places, null: false
    t.integer :sort_record_order, null: false
  end

  create_table :usda_foods_nutrients, force: true do |t|
    t.string  :nutrient_databank_number, null: false
    t.string  :nutrient_number, null: false
    t.float   :nutrient_value, null: false
    t.integer :num_data_points, null: false
    t.float   :standard_error
    t.string  :src_code, null: false
    t.string  :derivation_code
    t.string  :ref_nutrient_databank_number
    t.boolean :add_nutrient_mark
    t.integer :num_studies
    t.float   :min
    t.float   :max
    t.integer :degrees_of_freedom
    t.float   :lower_error_bound
    t.float   :upper_error_bound
    t.string  :statistical_comments
    t.string  :add_mod_date
    t.string  :confidence_code
  end

  create_table :usda_weights, force: true do |t|
    t.string  :nutrient_databank_number, null: false, index: true
    t.string  :sequence_number, null: false
    t.float   :amount, null: false
    t.string  :measurement_description, null: false
    t.float   :gram_weight, null: false
    t.integer :num_data_points
    t.float   :standard_deviation
  end

  create_table :usda_footnotes, force: true do |t|
    t.string :nutrient_databank_number, null: false, index: true
    t.string :footnote_number, null: false, index: true
    t.string :footnote_type, null: false, index: true
    t.string :nutrient_number, index: true
    t.string :footnote_text, null: false
  end

  create_table :usda_source_codes, force: true do |t|
    t.string :code, null: false, index: true
    t.string :description, null: false
  end
end
