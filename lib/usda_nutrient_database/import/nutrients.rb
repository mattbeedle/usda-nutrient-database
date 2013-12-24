module UsdaNutrientDatabase
  module Import
    class Nutrients < Base
      def import
        UsdaNutrientDatabase.log 'Importing nutrients'
        CSV.open(
          "#{directory}/NUTR_DEF.txt", 'r:iso-8859-1:utf-8', csv_options
        ) do |csv|
          csv.each do |row|
            UsdaNutrientDatabase::Nutrient.create!(
              nutrient_number: row[0], units: row[1], tagname: row[2],
              nutrient_description: row[3], number_decimal_places: row[4],
              sort_record_order: row[5]
            )
          end
        end
      end
    end
  end
end
