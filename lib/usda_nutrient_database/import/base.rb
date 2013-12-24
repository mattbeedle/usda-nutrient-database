module UsdaNutrientDatabase
  module Import
    class Base
      attr_reader :directory, :delimiter

      def initialize(directory)
        @directory = directory
        @delimiter = '^'
      end
    end
  end
end
