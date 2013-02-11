require 'commons'

##
# This example shows how to export query results in different formats.
#
Alf.connect(suppliers_and_parts_connspec) do |conn|

  ##
  # Let take the suppliers relation first
  #
  all_suppliers = conn.query{ suppliers }
  assert_kind_of Alf::Relation, all_suppliers

  ##
  # Relations can be exported in various data formats

  # As a text table
  assert_match /\| S1   \| Smith \|/, all_suppliers.to_text

  # In CSV
  assert_match /S1,Smith/, all_suppliers.to_csv

  # In in JSON
  assert_match /"sid":"S1","name":"Smith"/, all_suppliers.to_json

  # As ruby hashes
  assert_match /:sid => "S1", :name => "Smith"/, all_suppliers.to_rash

  # As YAML
  assert_match /- :sid: S1/, all_suppliers.to_yaml

  ##
  # Outputting directly on an IO object
  #
  # All to_xxx methods accept an IO instance (any instance responding to :<< in practice)
  # on which to send outputted tuples. For instance,
  #
  buffer = all_suppliers.to_csv(STDOUT)

  # The IO object is returned by the to_xxx method:
  assert buffer.object_id == STDOUT.object_id

  ##
  # Outputting in a specific order
  #
  # As relations are not ordered, no algebra operator allows obtaining an "ordered
  # relation". However, to_xxx methods all allow specifying such an order at output time:
  buffer = all_suppliers.to_csv(order: [[:city, :desc], [:sid, :asc]])
  #
  assert_equal [2, 3, 1, 4, 5], buffer.scan(/^S(\d)/m).map(&:first).map(&:to_i)

  # You can of course mix an order and an output IO
  assert_equal STDOUT, all_suppliers.to_csv(STDOUT, order: [[:city, :desc], [:sid, :asc]])

end
