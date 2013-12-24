module UsdaNutrientDatabase
  class Importer
    attr_reader :directory

    def initialize(directory = 'tmp/usda')
      @directory = directory
    end

    def import
      downloader.download_data
      food_group_importer.import
      food_importer.import
      nutrient_importer.import
      foods_nutrient_importer.import
    ensure
      downloader.cleanup
    end

    private

    def food_importer
      UsdaNutrientDatabase::Import::Foods.new(directory)
    end

    def nutrient_importer
      UsdaNutrientDatabase::Import::Nutrients.new(directory)
    end

    def foods_nutrient_importer
      UsdaNutrientDatabase::Import::FoodsNutrients.new(directory)
    end

    def food_group_importer
      UsdaNutrientDatabase::Import::FoodGroups.new(directory)
    end

    def downloader
      UsdaNutrientDatabase::Import::Downloader.new(directory)
    end
  end
end
