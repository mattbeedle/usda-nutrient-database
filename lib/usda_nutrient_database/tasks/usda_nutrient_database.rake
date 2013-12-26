namespace :usda do
  desc 'Import the latest USDA nutrition data'
  task import: :environment do
    UsdaNutrientDatabase::Importer.new('tmp/usda', 'sr25').import
  end

  [
    'Weights', 'Footnotes', 'FoodGroups', 'Foods', 'FoodsNutrients',
    'Nutrients', 'SourceCodes'
  ].each do |importer_name|
    desc "Import the USDA #{importer_name} table"
    task "import_#{importer_name.downcase}" => :environment do
      download_and_import(importer_name)
    end
  end

  def download_and_import(importer_name)
    UsdaNutrientDatabase::Import::Downloader.new('tmp/usda', 'sr25').
      tap do |downloader|
      downloader.download_and_unzip
      "UsdaNutrientDatabase::Import::#{importer_name}".constantize.
        new('tmp/usda/sr25').import
      downloader.cleanup
    end
  end
end