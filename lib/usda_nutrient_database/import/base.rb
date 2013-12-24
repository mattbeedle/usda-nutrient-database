module UsdaNutrientDatabase
  module Import
    class Base
      attr_reader :directory

      def initialize(directory)
        @directory = directory
      end

      private

      def csv_options
        { col_sep: '^', quote_char: '~' }
      end
    end
  end
end
