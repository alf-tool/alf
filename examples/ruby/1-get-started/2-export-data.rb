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

end
