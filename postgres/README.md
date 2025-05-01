# PostgreSQL adapter for Ductr ETL
This gem provides useful controls to operate Ductr with PostgreSQL databases.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'ductr-postgres'
```

And then execute:

```bash
$ bundle install
```

Require `ductr/postgres` in the `config/app.rb` file:

```ruby
require "ductr/postgres"
```

## Usage

You can now use the adapter in your YAML configuration:

```yml
adapters:
  some_postgres_database:
    adapter: postgres
    host: localhost
    user: postgres
    password: s3cr3t
    database: example
```

You can pass any option recognized by sequel.
See [the Sequel Sequel general options list](https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html#label-General+connection+options) for further details.
See [the Sequel PostgreSQL specific options list](https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html#label-postgres) for further details.

The configured adapter can now be used in Ductr jobs e.g.:

```ruby
source :some_postgres_database, :basic
def select_some_stuff(db)
  db[:items].where(name: %w[hello world])
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ductr-io/ductr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ductr-io/ductr-postgres/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Ductr::PostgreSQL project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ductr-io/ductr-postgres/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [LGPLv3 or later](https://opensource.org/license/lgpl-3-0/).
