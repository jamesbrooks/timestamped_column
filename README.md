Timestamped Column
==================

[![Build Status](https://secure.travis-ci.org/JamesBrooks/timestamped_column.png)](http://travis-ci.org/JamesBrooks/timestamped_column>)

Records modification time for specified database columns on a per-row basis (ActiveRecord).


Installation
------------

In your Gemfile

`gem 'timestamped_column'`

and run bundle install


Usage
-----

Usage is near identical to how created_at and updated_at function with the exception that Timestamped Column tracks individual column changes rather than entire row changes.

Automatically timestamps when particular attributes (columns) have been changed if a table has fields suffixed with `_updated_at/_updated_on`

Example: A table with a field `user_name` would have it's modification time recorded if a field named `user_name_updated_at` exists.
