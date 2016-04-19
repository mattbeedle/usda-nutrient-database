[![Stories in Ready](https://badge.waffle.io/mattbeedle/usda-nutrient-database.png?label=ready)](https://waffle.io/mattbeedle/usda-nutrient-database)
[![Code
Climate](https://codeclimate.com/github/mattbeedle/usda-nutrient-database.png)](https://codeclimate.com/github/mattbeedle/usda-nutrient-database)
[![Build
Status](https://travis-ci.org/mattbeedle/usda-nutrient-database.png?branch=master)](https://travis-ci.org/mattbeedle/usda-nutrient-database)
[![Coverage
Status](https://coveralls.io/repos/mattbeedle/usda-nutrient-database/badge.png)](https://coveralls.io/r/mattbeedle/usda-nutrient-database)
[![Dependency
Status](https://gemnasium.com/mattbeedle/usda-nutrient-database.png)](https://gemnasium.com/mattbeedle/usda-nutrient-database)
[![Gem
Version](https://badge.fury.io/rb/usda-nutrient-database.png)](http://badge.fury.io/rb/usda-nutrient-database)
[![Gitter
chat](https://badges.gitter.im/mattbeedle/usda-nutrient-database.png)](https://gitter.im/mattbeedle/usda-nutrient-database)

# USDA Nutrient Database

The USDA nutrition database is a great source of nutrition information. However,
the data formatting options (plain text ASCII files or MS-Access) leave a little
to be desired.

This is a simple gem to import the database into your ruby application.

## Using the USDA Nutrient Database REST API instead

Even after importing this data, keeping it up to date and adding/maintaining
additional logic such as full text search, weight conversion, etc is a pain. As
an alternative I have put together a small RESTful web service to do this for you.
You can find the docs at
[http://docs.usdanutrientservice.apiary.io/](http://docs.usdanutrientservice.apiary.io/)

## Installation

Add this line to your application's Gemfile:

    gem 'usda-nutrient-database'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install usda-nutrient-database

If you're using rails then copy the migrations across:
```
rake usda_nutrient_database_engine:install:migrations
```

## Configuration

```ruby
UsdaNutrientDatabase.configure do |config|
  config.batch_size = 20000 # import batch size, if using activerecord-import
  config.perform_logging = true # default false
  config.logger = Rails.logger # default Logger.new(STDOUT)
  config.usda_version = 'sr25' # default sr28
end
```

## Usage

### Importing with UPSERT (takes around 2 minutes)

If you are running MySQL => 5.6 or PostgreSQL => 9.5 then you're in luck, you
can use UPSERT (insert or update) to speed up imports x30. To do this you're
going to need to install
[activerecord-import](https://github.com/zdennis/activerecord-import)

```ruby
require 'activerecord-import/base'
ActiveRecord::Import.require_adapter('postgresql')

# You may want to disable logging during this process to avoid dumping huge SQL
# strings in to your logs
ActiveRecord::Base.logger = Logger.new('/dev/null')
```

Now run the rake task which will import everything in around 2 minutes.
```
rake usda:import
```


### Importing without UPSERT (takes 60+ minutes)

Import the latest data with the import task:
```
rake usda:import
```
This is going to take a while. 60+ minutes on my 2.66 GHz i7 macbook pro. You ca
also import individual tables using the other import tasks. To see the available
tasks:
```
rake -T usda
```

### Models

Use the models to query and profit:
```
UsdaNutrientDatabase::FoodGroup
UsdaNutrientDatabase::Food
UsdaNutrientDatabase::Nutrient
UsdaNutrientDatabase::FoodsNutrient
UsdaNutrientDatabase::Weight
UsdaNutrientDatabase::SourceCode
```

## Issues

If you find a bug then add it to the issues here on github. Ideally with a pull
request to fix it, or at least with a failing test. When you report a bug,
number 1 rule is: don't be a dick.

Any feature requests/ideas can also go in the issues list.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

Many thanks to the following contributers:

- [@benfalk](https://github.com/benfalk)

## Versioning

This gem follows [Semantic Versioning](http://semver.org)
