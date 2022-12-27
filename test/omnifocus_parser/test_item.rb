# frozen_string_literal: true

require "test_helper"
require "csv"

module OmnifocusParser
  class ItemTest < Minitest::Test
    def setup
      @csv_rows = CSV.read("test/fixtures/example.csv", headers: true)
    end

    def test_parses_row_into_project
      project = Builder.from_row(@csv_rows[0])
      assert_instance_of Project, project
    end

    def test_parses_row_into_action
      action = Builder.from_row(@csv_rows[1])
      assert_instance_of Action, action
      assert_equal "item name", action.name
      assert_equal "Ruby and Rails", action.project
      assert_equal "My Context", action.context
      assert_equal ["Check Out"], action.tags
      assert_equal "My Notes", action.notes
    end
  end
end
