namespace :usda do
  desc 'Import the latest USDA nutrition data'
  task import: :environment do
    UsdaNutrientDatabase::Importer.new('tmp/usda', 'sr25').import
  end

  desc 'Import the USDA weights table'
  task import_weights: :environment do
    UsdaNutrientDatabase::Import::Downloader.new('tmp/usda', 'sr25').
      tap do |downloader|
      downloader.download_and_unzip
      UsdaNutrientDatabase::Import::Weights.new('tmp/usda/sr25').import
      downloader.cleanup
    end
  end
end