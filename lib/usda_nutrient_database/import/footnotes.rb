module UsdaNutrientDatabase
  module Import
    class Footnotes < Base

      private

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

      def save_objects
        UsdaNutrientDatabase::Footnote.import(columns, objects_to_import, {
          validate: false,
          on_duplicate_key_update: {
            conflict_target: %i(nutrient_databank_number nutrient_number footnote_number),
            columns: columns
          }
        })
      end
    end
  end
end
