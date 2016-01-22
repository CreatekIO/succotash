# Succotash

A simple seeding strategy for your project which helps maintain and separate **static** and **demo** data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'succotash'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install succotash


### Automatic configuration
```ruby
$ rake succotash:install
```

### Manual configuration
Create the following files

**db/seeds/static.yml**
```ruby
# list file names that needs to be included in the order required
# eg
# :static_seed_files:
#   - test_file.rb
#   - demo_seed.rb

:static_seed_files:
```

**db/seeds/demo.yml**
```ruby
# list file names that needs to be included in the order required
# eg
# :demo_seed_files:
#   - test_file.rb
#   - demo_seed.rb

:demo_seed_files:

```


## Problem
- Inconsistent approach to seeding data on development, integration and staging causing confusion and a loss of productivity (for example when manually seeded data is lost after a drop+seed)
- Different approaches may be required for different kinds of seed data (demo seed, look-up table seed)
- No defined approach to migrating data when structure changes (even more important now that we are live)

These problems cost time for developers as they build local versions of services and each time they move services into integration, staging, acceptance and production.

## Definitions

##### Static Data
Data that is required by the system in order for the system to function correctly. We should assume that this is run against **production** after every release so it should be **idempotent**. It would typically contain lookup data, but it must not include sample users or example data.

##### Demo Data
Data that is required to demo the system or demo individual features. Typically this will be run after a db:reset (and after the seed). It should never be run against production and therefore does not have to be idempotent.

##### Idempotent
Doesn’t change anything if you run it more than once, or more formally: ‘denoting an element of a set which is unchanged in value when multiplied or otherwise operated on by itself.’)



## Usage

Both static and demo data.
```bash
$ rake db:seed
```

Static data only.
```bash
$ rake db:seed:static
```

Demo data only.
```bash
$ rake db:seed:demo
```

`test.rb` file in the `db/seeds/static` directory
```bash
$ rake db:seed:static:test
```

`test.rb` file in the `db/seeds/demo` directory
```bash
$ rake db:seed:demo:test
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CreatekIO/succotash.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

