# OmnifocusParser

This library parses a CSV export from [OmniFocus](https://www.omnigroup.com/omnifocus/) into a set of convenient objects.

Note: I wrote this gem to try out the newly added `Data` core class in Ruby ([learn more](https://blog.saeloun.com/2022/11/22/data-immutable-object.html)), so it can only be used with Ruby 3.2 or newer.

Note: The CSV export is missing some fields. If you need those, [RubyFocus](https://rubygems.org/gems/rubyfocus) is probably be a better choice.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add omnifocus_parser

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install omnifocus_parser

## Usage

```ruby
require "omnifocus_parser"

parser = OmniFocusParser::Parser.new("example.csv")
entries = parser.parse
entries[0].class # => OmnifocusParser::Project
entries[1].class # => OmnifocusParser::Item
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andyw8/omnifocus_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
