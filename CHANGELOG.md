# 0.16.2 - FIX ME

* No change in this submodule.

# 0.16.1 - 2014-04-30

* Fix a SQL compilation bug when compiling intersect(union).

# 0.16.0 - 2014-02-18

* Fixed SQL compilation when projecting over set operators (minus, union,
  intersection)
* Fixed SQL compilation of join with DEE/DUM.
* Removed `is_table_dee` attribute when projecting all attributes away from
  a SQL data source.
* Fixed compilation of shortcut operators involving complex expressions.
* Fixed Tuple() that now accepts no arg and returns an empty tuple.
* Fixed "comparison failure" errors in the presence of `nil`. You should NOT
  use `nil`, but robustness is probably necessary anyway.
* Added the ability to load a .rash file through Path#load. Result is an array
  of hashes.
* Fixed default signature of Hierarchize.
* Added a basic `image` operator as a shortcut expression.

# 0.15.0 - 2013-11-01

New birthday.
