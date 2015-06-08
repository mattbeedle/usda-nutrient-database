module UsdaNutrientDatabase
  module Import
    class Footnotes < Base

      private

      def klass
        UsdaNutrientDatabase::Footnote
      end

      def find_or_initialize(row)
        UsdaNutrientDatabase::Footnote.find_or_initialize_by(
          nutrient_databank_number: row[0], footnote_number: row[1],
          nutrient_number: row[2]
        )
      end

      def filename
        'FOOTNOTE.txt'
      end

      def columns
        @columns ||= [
          :nutrient_databank_number, :footnote_number, :footnote_type,
          :nutrient_number, :footnote_text
        ]
      end

      def log_import_started
        UsdaNutrientDatabase.log 'Importing footnotes'
      end
    end
  end
end
