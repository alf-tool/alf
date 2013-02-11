require 'commons'

##
# This example shows how to connect to a database and send some queries.
#
Alf.connect(suppliers_and_parts_connspec) do |conn|

  ##
  # `conn` is a Alf database connection, allowing to send queries, among others
  # See Alf::Database::Connection
  #

  ##
  # Let simply do that and see who are the suppliers.
  #
  # WARN: Using `query` loads the entire result in memory as a Alf::Relation.
  # See later for smarter ways of using query outputs.
  #
  all_suppliers = conn.query{
    suppliers
  }
  #
  assert_kind_of Alf::Relation, all_suppliers
  assert_equal 5, all_suppliers.size

  ##
  # Let now filter the suppliers in London
  #
  in_london = conn.query{
    restrict(suppliers, city: 'London')
  }
  #
  assert_kind_of Alf::Relation, in_london
  assert_equal 2, in_london.size

  ##
  # An example of a more complex query?
  #
  # Only suppliers that supply at least part 'P2' and live in Paris
  #
  active_in_paris = conn.query{
    restrict(
      matching(
        suppliers,
        restrict(supplies, pid: 'P2')),
    city: 'Paris')
  }
  #
  assert_kind_of Alf::Relation, active_in_paris
  assert_equal 2, active_in_paris.size

end
