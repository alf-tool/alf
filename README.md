# Alf

Relational Algebra at your fingertips

[![Build Status](https://secure.travis-ci.org/alf-tool/alf.png)](http://travis-ci.org/alf-tool/alf)
[![Dependency Status](https://gemnasium.com/alf-tool/alf.png)](https://gemnasium.com/alf-tool/alf)

## Links

* [Try it online](http://www.try-alf.org/)
* [Official documentation](http://www.try-alf.org/doc/)
* [Blog](http://www.try-alf.org/blog/)
* [Source and Issues](http://github.com/alf-tool/alf)

## Overview

Alf is a modern query language, rooted in relational algebra, and implemented
as a Ruby Domain Specific Language. It is distributed as a consolidated ruby
gem:

```
gem install alf
```

You'll also need the usual adapter gems for connecting to SQL engines, such as
`pg` for PostgreSQL or `sqlite3` for SQlite. I've not tested Alf against MySQL
and won't.

See the official documentation for getting started using Alf
[in Ruby](http://www.try-alf.org/doc/pages/alf-in-ruby) and
[in Shell](http://www.try-alf.org/doc/pages/alf-in-shell).

## Detailed overview

The consolidated gem is assembled from the following components:

* [alf-core](http://github.com/alf-tool/alf-core) core classes of Alf,
  algebra, memory engine, Relation, compiler, and so on. This is actually Alf
  itself, I would say.
* [alf-sql](http://github.com/alf-tool/alf-sql) extension of core's compiler
  to handle SQL compilation specifically, in an abstract way.
* [alf-sequel](http://github.com/alf-tool/alf-sequel) an adapter for
  connecting to SQL DBMSs using [Sequel](http://sequel.rubyforge.org/).
* [alf-shell](http://github.com/alf-tool/alf-shell) implements the commandline
  tool that you can use without even knowing ruby.
* [alf-rack](http://github.com/alf-tool/alf-rack) a few Rack middlewares for
  using Alf in ruby web applications.
* [alf-doc](http://github.com/alf-tool/alf-doc) is the source of all the
  documentation found in man pages (shell) and on [try-alf.org](http://www.try-alf.org/).
* [try-alf](http://github.com/alf-tool/try-alf) is the source code of try-alf.org
  itself.

Those components are distributed as separated ruby gems as well. A typical
ruby configuration (Gemfile) for using Alf and connecting to SQL databases is
either:

```
# consolidated gem, possibly with a lot of uneeded dependencies.
gem "alf", "~> 0.15.0"
```

or

```
# take only those gems that you need, here for a web app connecting to SQL
# databases.
gem "alf-core", "~> 0.15.0"   # you can even omit this one
gem "alf-sequel", "~> 0.15.0"
gem "alf-rack", "~> 0.15.0"
```

## Contributing

As usual, on github, issues and pull requests, either on sub-projects (if you
know where your issue/contribution fits) or on this one (if you don't).

Integration work on Alf requires having all components available. The scenario
below might be a good way for getting started:

```
git clone git://github.com/alf-tool/alf.git
git submodule init
git submodule update
rake mod:test
rake test
```

Let me know if some tests fail in your environment. I'm not sure to know the
idiomatic way to use github with submodules when clones are involved. If you
do know, feel free to contribute your first pull request on this README ;-)
