require 'faraday'
require 'usda_nutrient_database/configuration'
require 'usda_nutrient_database/food_group'
require 'usda_nutrient_database/food'
require 'usda_nutrient_database/nutrient'
require 'usda_nutrient_database/foods_nutrient'
require 'usda_nutrient_database/importer'
require 'usda_nutrient_database/import/base'
require 'usda_nutrient_database/import/downloader'
require 'usda_nutrient_database/import/food_groups'
require 'usda_nutrient_database/import/foods'
require 'usda_nutrient_database/import/foods_nutrients'
require 'usda_nutrient_database/import/nutrients'
require 'usda_nutrient_database/railtie' if defined?(Rails)
require 'usda_nutrient_database/version'

module UsdaNutrientDatabase
  class << self
    attr_writer :configuration

    def log(message, level = :debug)
      configuration.logger.send(level, message)
    end

    def configuration
      @configuration ||= UsdaNutrientDatabase::Configuration.new
    end
  end

  def self.configure
    self.configuration = UsdaNutrientDatabase::Configuration.new
    yield(self.configuration)
    self.configuration
  end
end
