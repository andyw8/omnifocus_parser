require "csv"

module OmnifocusParser
  class Parser
    def initialize(csv)
      @csv = csv
    end

    def parse
      CSV.foreach(@csv, headers: true).map do |row|
        Item.from_row(row)
      end
    end
  end
end
