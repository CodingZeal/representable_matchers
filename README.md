# Representable Matchers

[![Build Status](https://travis-ci.org/CodingZeal/representable_matchers.png?branch=master)](https://travis-ci.org/CodingZeal/representable_matchers) [![Code Climate](https://codeclimate.com/github/CodingZeal/representable_matchers.png)](https://codeclimate.com/github/CodingZeal/representable_matchers) [![Gem Version](https://badge.fury.io/rb/representable_matchers.png)](http://badge.fury.io/rb/representable_matchers)

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

With submatchers

    it { should have_representable_property(:name).class_name("String") }
    it { should have_representable_property(:class_and_extension).class_name("Array").extends(AbstractRepresenter) }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
