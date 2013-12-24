module UsdaNutrientDatabase
  module Import
    class Foods < Base
      def import
        CSV.open("#{directory}/FOOD_DES.txt", 'r', csv_options) do |csv|
          csv.each do |row|
            UsdaNutrientDatabase::Food.create!(
              nutrient_databank_number: row[0],
              food_group_code: row[1],
              long_description: row[2],
              short_description: row[3],
              common_names: row[4],
              manufacturer_name: row[5],
              survey: row[6],
              refuse_description: row[7],
              percentage_refuse: row[8],
              nitrogen_factor: row[9],
              protein_factor: row[10],
              fat_factor: row[11],
              carbohydrate_factor: row[12]
            )
          end
        end
      end
    end
  end
end
