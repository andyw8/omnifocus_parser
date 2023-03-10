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

    def test_unflagged_item
      item = find_row("unflagged")

      refute item.flagged
    end

    def test_flagged_item
      item = find_row("flagged")

      assert item.flagged
    end

    def test_due_date
      item = find_row("with due date")

      assert_equal DateTime.new(2022, 11, 7, 23, 0, 0), item.due_date
    end

    def test_multiline
      parser = Parser.new("test/fixtures/example_split_line.csv")

      assert_equal "My Notes line 1\nMy Notes Line 2", parser.parse.last.notes
    end

    private

    def find_row(name)
      parser = Parser.new("test/fixtures/example.csv")
      parser.parse.find { |row| row.name == name } or raise "Row not found"
    end
  end
end
