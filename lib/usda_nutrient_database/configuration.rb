module UsdaNutrientDatabase
  class Configuration
    attr_accessor :logger
    attr_writer   :perform_logging,
      :usda_version

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
