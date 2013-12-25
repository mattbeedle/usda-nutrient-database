class CreateUsdaSourceCodes < ActiveRecord::Migration
  def change
    create_table :usda_source_codes do |t|
      t.string :code, null: false, index: true
      t.string :description, null: false
    end
  end
end
