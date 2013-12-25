module UsdaNutrientDatabase
  module Import
    class FoodGroups < Base

      private

      def extract_row(row)
        build_food_group(row).save
      end

      def build_food_group(row)
        UsdaNutrientDatabase::FoodGroup.new.tap do |food_group|
          columns.each_with_index do |column, index|
            food_group.send("#{column}=", row[index])
          end
        end
      end

      def columns
        @columns ||= %w(code description)
      end

      def filename
        'FD_GROUP.txt'
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Importing food groups'
      end
    end
  end
end
