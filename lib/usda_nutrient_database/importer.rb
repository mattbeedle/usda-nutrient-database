module UsdaNutrientDatabase
  class Importer
    attr_reader :directory, :version

    def initialize(directory = 'tmp/usda', version = 'sr25')
      @directory = directory
      @version = version
    end

    def import
      downloader.download_and_unzip
      food_group_importer.import
      food_importer.import
      nutrient_importer.import
      foods_nutrient_importer.import
      weights_importer.import
    ensure
      downloader.cleanup
    end

    private

    def food_importer
      UsdaNutrientDatabase::Import::Foods.new("#{directory}/#{version}")
    end

    def nutrient_importer
      UsdaNutrientDatabase::Import::Nutrients.new("#{directory}/#{version}")
    end

    def foods_nutrient_importer
      UsdaNutrientDatabase::Import::FoodsNutrients.
        new("#{directory}/#{version}")
    end

    def food_group_importer
      UsdaNutrientDatabase::Import::FoodGroups.new("#{directory}/#{version}")
    end

    def weights_importer
      UsdaNutrientDatabase::Import::Weights.new("#{directory}/#{version}")
    end

    def downloader
      UsdaNutrientDatabase::Import::Downloader.new(directory, version)
    end
  end
end
