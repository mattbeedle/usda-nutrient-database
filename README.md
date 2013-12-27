# USDA Nutrient Database

The USDA nutrition database is a great source of nutrition information. However,
the data formatting options (plain text ASCII files or MS-Access) leave a little
to be desired.

This is a simple gem to import the database into your ruby application.

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

## Usage

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

Use the models to query and profit:
```
UsdaNutrientDatabase::FoodGroup
UsdaNutrientDatabase::Food
UsedNutrientDatabase::Nutrient
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

## Versioning

This gem follows [Semantic Versioning](http://semver.org)
