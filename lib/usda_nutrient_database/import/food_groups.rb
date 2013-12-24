module UsdaNutrientDatabase
  module Import
    class FoodGroups < UsdaNutrientDatabase::Import::Base
      def import
        options = { col_sep: delimiter }
        CSV.open("#{directory}/FD_GROUP.txt", 'r', options) do |csv|

        end
      end
    end
  end
end
