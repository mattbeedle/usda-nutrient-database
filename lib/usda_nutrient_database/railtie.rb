module UsdaNutrientDatabase
  class Railtie < Rails::Railtie
    railtie_name :usda_nutrient_database

    rake_tasks do
      load 'tasks/usda_nutrient_database.rake'
    end
  end
end