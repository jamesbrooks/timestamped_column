# timestamped_column
[![Build Status](https://secure.travis-ci.org/JamesBrooks/timestamped_column.png)](http://travis-ci.org/JamesBrooks/timestamped_column>) [![Dependency Status](https://gemnasium.com/JamesBrooks/timestamped_column.png)](https://gemnasium.com/JamesBrooks/timestamped_column)

Records the modification time for specific database columns on individual records (using ActiveRecord).


## Requirements

* Rails 3

Tested and working correctly with:

* Ruby: 1.8.7 1.9.3
* Rails: 3.0, 3.1, 3.2 and edge.

View the [test results for the most recent commit](http://travis-ci.org/JamesBrooks/timestamped_column) using these Ruby and Rails version combinations (thanks to Travis CI).


## Installation

Add `timestamped_column` to your `Gemfile`:

```
gem 'timestamped_column'
```


## Usage

Usage is similar to how `created_at`/`updated_at` function in Rails. All you need to start tracking attribute modification times is to add a new column to store the modification value. The column that tracks the modification value should be suffxed with either `_updated_at` or `_updated_on`.


## Example

If you have a model `User` with an attribute `name` that you want to track the modification time of you just simple add an column named `name_updated_at` (or `name_updated_on`) to the `users` table.

`timestamped_column` checked for the presence of columns named like this and automatically updates these when the attributes they track are changed.
