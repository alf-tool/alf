require 'alf'
require 'rspec'
require 'sap'

ENV['DATABASE'] ||= 'postgres'

FIXTURES_FOLDER = Path.backfind('fixtures')

class Adapters

  def fake
    @fake ||= Alf.examples_adapter
  end

  def sqlite
    @sqlite ||= begin
      url = FIXTURES_FOLDER/"suppliers-and-parts/suppliers-and-parts.db"
      Alf::Sequel::Adapter.sequel_db(url)
    end
  end

  def postgres
    @postgres ||= begin
      url = "postgres://alf@localhost/suppliers_and_parts"
      Alf::Sequel::Adapter.sequel_db(url)
    end
  end

end
ADAPTERS = Adapters.new

module AlfIntegrationHelpers

  def fixtures_folder
    FIXTURES_FOLDER
  end

  def adapter
    ADAPTERS.send ENV['DATABASE']
  end

  def db
    Alf::Database.new(adapter, viewpoint: Sap::Views[])
  end

  def conn
    db.connection
  end

end

RSpec.configure do |c|
  c.include(AlfIntegrationHelpers)
end
