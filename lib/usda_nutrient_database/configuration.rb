module UsdaNutrientDatabase
  class Configuration
    attr_accessor :logger
    attr_writer   :perform_logging

    def logger
      @logger ||= Logger.new(STDOUT)
    end

    def perform_logging?
      @perform_logging ||= false
    end
  end
end
