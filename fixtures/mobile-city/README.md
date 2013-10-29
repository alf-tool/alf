# Mobile City

This examples implements a context-oriented database interface using Alf, that
illustrates how separation of concerns can be achieved when facing complex
data requirements. The case study is taken from the following scientific
paper:

> Castro, Sergio, et al. "DynamicSchema: a lightweight persistency framework for context-oriented data management." Proceedings of the International Workshop on Context-Oriented Programming. ACM, 2012.

## Description (taken from the paper above)

The case study involves an application called *Mobile City* whose objective is to help and inform tourists when visiting an unknown city. Among others, the application offers tourist information on various _points of interest_ (POIs) in a city. Each POI has a (textual) description, an image, as well as
some other attributes. POIs are organized hierarchically according to their location.

Each user of the application has its own user profile, which contains among
others the preferred language of the user and his age group. The age group can
have only two possible values: _adult_ and _child_. This profile influences
the actual description that should be shown when browsing the information on
POIs and images, so that the language and age group of the description match with those in the user profile. For example, if the user speaks French and is of the age group child, the application will use child-friendly descriptions in French for the POIs and images being shown

## Data requirements

From the original problem description, we extracted the following
requirements. Alf's viewpoints are used to implement each requirement in
isolation (see `lib/mobile_city/viewpoints`). The main viewpoint composes them
so as to build the context-oriented database interface that meets all
requirements at once:

* Sensible POIs shall not be visible if the user is a child.
* User profiles shall not be visible by other users than the current one.
* Private POIs shall only be visible if owned by the current user.
* Image and POI descriptions should automatically be served in the user's prefered language.

In addition to those requirements, we add the following meta-requirements (i.e. on the approach itself):

* The database interface should lead to a queryable (and complete) database schema. It should act transparently as if it was a base schema.
* The database interface should abstract from the context, that it, it should present base relations without any reference to the context itself.

## Example

```
require 'mobile_city'

db = MobileCity.sqlite_database

# Let first take the Native viewpoint. This is the base database, non
# context-oriented.
viewpoint = MobileCity::Viewpoint::Native

# Connect to the database and send a few queries.
MobileCity.sqlite_database.connect(viewpoint: viewpoint) do |conn|
  puts conn.query{
    pois
  }
  puts conn.query{
    restrict(poi_images, poi: "brussels")
  }
end

# The first query above `pois` returns all point of interest, and should
# return something like:
# +-----------+----------------+-----------+
# | :id       | :name          | :sensible |
# +-----------+----------------+-----------+
# | brussels  | Brussels       | false     |
# | manneken  | Manneken Pis   | false     |
# | delirium  | Delirium Cafe  | true      |
# | kites     | Kites shop     | false     |
# | paris     | Paris          | false     |
# | chocolate | Chocolate shop | false     |
# +-----------+----------------+-----------+

# Let now take the viewpoint of Maria Delsol who is a child and speaks english
viewpoint = MobileCity::Viewpoint[user_id: 'mdelsol']

# Let see how the same queries react now.
MobileCity.sqlite_database.connect(viewpoint: viewpoint) do |conn|
  # Point of interests are correctly filtered according to the context.
  # Descriptions are inlined.
  puts conn.query{
    pois
  }
  # Relations can be used in queries as usual.
  puts conn.query{
    restrict(poi_images, poi: "brussels")
  }
end

# The first query above abstracts from the context but meet the requirements:
# Maria is a child => no sensible POI. All descriptions inlined an in english.
# +-----------+----------------+-----------+---------------------+
# | :id       | :name          | :sensible | :description        |
# +-----------+----------------+-----------+---------------------+
# | brussels  | Brussels       | false     | Brussels (the city) |
# | chocolate | Chocolate shop | false     | Chocolate shop      |
# | manneken  | Manneken Pis   | false     | Manneken Pis        |
# | paris     | Paris          | false     | Paris (the city)    |
# +-----------+----------------+-----------+---------------------+
```
