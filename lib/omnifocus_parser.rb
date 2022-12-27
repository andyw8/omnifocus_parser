# frozen_string_literal: true

require_relative "omnifocus_parser/version"
require_relative "omnifocus_parser/item"
require_relative "omnifocus_parser/parser"

module OmnifocusParser
  class Error < StandardError; end
end
