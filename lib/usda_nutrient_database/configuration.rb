module UsdaNutrientDatabase
  class Configuration
    attr_accessor :logger

    def logger
      @logger ||= Logger.new(STDOUT)
    end
  end
end
