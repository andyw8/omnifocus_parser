# frozen_string_literal: true

require "test_helper"

module OmnifocusParser
  class ItemTest < Minitest::Test
    def test_parses_row
      csv_rows = CSV.read("test/fixtures/example.csv", headers: true)

      item = Item.from_row(csv_rows[1])

      assert_equal "Action", item.type
      assert_equal "item name", item.name
      assert_equal "Ruby and Rails", item.project
      assert_equal "My Context", item.context
      assert_equal ["Check Out"], item.tags
      assert_equal "My Notes", item.notes
    end
  end
end
