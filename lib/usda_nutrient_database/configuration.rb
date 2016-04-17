module UsdaNutrientDatabase
  class Configuration
    attr_accessor :logger
    attr_writer :batch_size,
      :perform_logging,
      :usda_version

    def batch_size
      @batch_size ||= 10000
    end

    def logger
      @logger ||= Logger.new(STDOUT)
    end

    def perform_logging?
      @perform_logging ||= false
    end

    def usda_version
      @usda_version || 'sr28'
    end
  end
end
