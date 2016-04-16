class FixFootnotesIndexes < ActiveRecord::Migration
  def change
    change_table :usda_footnotes do |t|
      t.remove_index :nutrient_databank_number
      t.remove_index :footnote_number
      t.remove_index :footnote_type
      t.remove_index :nutrient_number

      t.index [
        :nutrient_databank_number,
        :nutrient_number,
        :footnote_number
      ], {
        unique: true,
        name: "index_usda_footnotes_on_unique_keys"
      }

      t.index [
        :nutrient_databank_number,
        :footnote_type
      ], {
        name: "index_usda_footnotes_on_databank_number_and_type"
      }
    end
  end
end
