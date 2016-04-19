require 'faraday'
require 'active_record'
require 'usda_nutrient_database/configuration'
require 'usda_nutrient_database/engine' if defined?(Rails)
require 'usda_nutrient_database/food_group'
require 'usda_nutrient_database/food'
require 'usda_nutrient_database/footnote'
require 'usda_nutrient_database/nutrient'
require 'usda_nutrient_database/foods_nutrient'
require 'usda_nutrient_database/source_code'
require 'usda_nutrient_database/importer'
require 'usda_nutrient_database/import/base'
require 'usda_nutrient_database/import/downloader'
require 'usda_nutrient_database/import/food_groups'
require 'usda_nutrient_database/import/foods'
require 'usda_nutrient_database/import/foods_nutrients'
require 'usda_nutrient_database/import/footnotes'
require 'usda_nutrient_database/import/nutrients'
require 'usda_nutrient_database/import/source_codes'
require 'usda_nutrient_database/import/weights'
require 'usda_nutrient_database/railtie' if defined?(Rails)
require 'usda_nutrient_database/version'
require 'usda_nutrient_database/weight'

module UsdaNutrientDatabase
  class << self
    attr_writer :configuration

    def log(message, level = :debug)
      if configuration.perform_logging?
        configuration.logger.send(level, message)
      end
    end

    def configuration
      @configuration ||= UsdaNutrientDatabase::Configuration.new
    end

    def usda_version
      @usda_version ||= configuration.usda_version
    end
  end

  def self.configure
    self.configuration = UsdaNutrientDatabase::Configuration.new
    yield(self.configuration)
    self.configuration
  end
end
