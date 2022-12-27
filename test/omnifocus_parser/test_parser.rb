require "test_helper"

module OmnifocusParser
  class ParserTest < Minitest::Test
    def test_parse
      parser = Parser.new("test/fixtures/example.csv")
      items = parser.parse
      assert_equal 2, items.size
    end
  end
end
