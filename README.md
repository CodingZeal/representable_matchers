# Representable Matchers

[![Code Climate](https://codeclimate.com/github/CodingZeal/representable_matchers.png)](https://codeclimate.com/github/CodingZeal/representable_matchers)

Shoulda-style RSpec/Test Unit matchers for the Representable Gem

## Installation

Add this line to your application's Gemfile:

    gem 'representable_matchers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install representable_matchers

## Usage

    it { should have_representable_property(:name) }
    it { should have_representable_collection(:children) }
    it { should have_representable_hash(:preferences) }

With submatchers for addition options

    it { should have_representable_property(:father).class_name("Person").extends(Person::Representer) }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
