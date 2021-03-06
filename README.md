# Reserved Subdomains

![Ruby](https://github.com/clayton/reserved_subdomains/workflows/Ruby/badge.svg)
![Ruby Gem](https://github.com/clayton/reserved_subdomains/workflows/Ruby%20Gem/badge.svg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reserved_subdomains'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reserved_subdomains

## Usage

Use the custom validator on your `ActiveModel` or `ActiveRecord` class for normal validation.

```ruby
class Company < ApplicationRecord
  validates :subdomain, allowed_subdomain: true
end
```

## Thanks

* https://github.com/Sage/vat_id_validator - for code organization and testing inspiration
* https://github.com/nkkollaw/reserved-subdomains - For the list of subdomains

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/clayton/reserved_subdomains.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
