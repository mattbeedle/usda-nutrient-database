module UsdaNutrientDatabase
  module Import
    class Footnotes < Base

      private

      def extract_row(row)
        build_footnote(row).save
      end

      def build_footnote(row)
        UsdaNutrientDatabase::Footnote.new.tap do |footnote|
          columns.each_with_index do |column, index|
            footnote.send("#{column}=", row[index])
          end
        end
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
