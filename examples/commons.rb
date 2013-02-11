$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'alf'
require 'test/unit'

include Test::Unit::Assertions

def suppliers_and_parts_connspec
  case ENV['ALF_FIXTURES_KIND']
  when 'sqlite' then Path.dir/'fixtures/suppliers-and-parts.db'
  when 'folder' then Path.dir/'fixtures/suppliers-and-parts'
  else
    Path.dir/'fixtures/suppliers-and-parts.db'
  end
end