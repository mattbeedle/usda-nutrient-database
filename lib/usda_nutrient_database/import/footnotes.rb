module UsdaNutrientDatabase
  module Import
    class Footnotes < Base
      def import
        CSV.open(
          "#{directory}/FOOTNOTE.txt", 'r:iso-8859-1:utf-8', csv_options
        ) do |csv|
          csv.each { |row| extract_row(row) }
        end
      end

      private

      def extract_row(row)
        UsdaNutrientDatabase::Footnote.create! extract_row_data(row)
      end

      def extract_row_data(row)
        {}.tap do |attrs|
          columns.each_with_index do |col, index|
            attrs.merge!(col => row[index])
          end
        end
      end

      def columns
        [
          :nutrient_databank_number, :footnote_number, :footnote_type,
          :nutrient_number, :footnote_text
        ]
      end
    end
  end
end
