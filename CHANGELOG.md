# 0.15.1 - FIX ME

* Fixed SQL generation when projecting over set operators (minus, union,
  intersection)
* Fixed Tuple() that now accepts no arg and returns an empty tuple.
* Fixed SQL compilation of join with DEE/DUM.
* Removed `is_table_dee` attribute when projecting all attributes away from
  a SQL data source.
* Fixed compilation of shortcut operators involving complex expressions.
* Fixed "comparison failure" errors in the presence of `nil`. You should NOT
  use `nil`, but robustness is probably necessary anyway.
* Added the ability to load a .rash file through Path#load. Result is an array
  of hashes.
* Fixed default signature of Hierarchize.

# 0.15.0 - 2013-11-01

New birthday.
