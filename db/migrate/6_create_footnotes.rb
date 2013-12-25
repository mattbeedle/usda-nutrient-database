class CreateFootnotes < ActiveRecord::Migration
  def change
    create_table :usda_footnotes do |t|
      t.string :nutrient_databank_number, null: false, index: true
      t.string :footnote_number, null: false, index: true
      t.string :footnote_type, null: false, index: true
      t.string :nutrient_number, index: true
      t.string :footnote_text, null: false
    end
  end
end
