namespace :usda do
  desc 'Import the latest USDA nutrition data'
  task import: :environment do
    UsdaNutrientDatabase::Importer.new('tmp/usda', 'sr25').import
  end

  desc 'Import the USDA weights table'
  task import_weights: :environment do
    download_and_import('Weights')
  end

  desc 'Import USDA foot notes data'
  task import_footnotes: :environment do
    download_and_import('Footnotes')
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