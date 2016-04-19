# Changelog

## 2.0.0

- Removed IDs from tables which don't have them in USDA data. Instead opted to
  use compound keys the same way they do. The upgrade path is simple but if you
  have any other tables linking directly to USDA tables you're going to need to
  change them to point to the composite key in the associations.
  [#15](https://github.com/mattbeedle/usda-nutrient-database/pull/15)

## 1.4.0

- Upgrade to version SR28 USDA dataset
  [#14](https://github.com/mattbeedle/usda-nutrient-database/pull/14)

## 1.2.0

- Upgrade to version SR27 USDA dataset.
  [#5](https://github.com/mattbeedle/usda-nutrient-database/pull/5)
- Require ActiveRecord so the gem can work outside of Rails.
  [#5](https://github.com/mattbeedle/usda-nutrient-database/pull/5)

## 1.0.0

- Update README
- Bump to version 1 as this is being used in production now, is following
  semver, and backwards compatibility is a concern

## 0.8.1

- Fix individual import tasks.

## 0.8.0

- Add Source Codes importer and model

## 0.7.0

- Add import tasks for individual tables

## 0.6.0

- Refactor importing code
- Move tasks within usda_nutrient_database
- Allow logging to be turned off, to stop polluting test output

## 0.5.0

- Add Footnotes

## 0.4.0

- Add weights import task
- Correct import time in README

## 0.3.0

- Add weights

## 0.2.0

- Add homepage to gemspec

## 0.1.1

- Added instructions to README
- Fixed migration ids and primary keys
- Added engine for rails


## 0.1.0

- Add description and summary to gemspec
- Add foods
- Add food groups
- Add downloader
- Add food groups importer
- Add foods importer