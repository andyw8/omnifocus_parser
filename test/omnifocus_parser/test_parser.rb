require "test_helper"

module OmnifocusParser
  class ParserTest < Minitest::Test
    def test_parse
      parser = Parser.new("test/fixtures/example.csv")
      items = parser.parse
      assert_equal File.read("test/fixtures/example.csv").lines.count, items.size + 1
    end
  end
end
