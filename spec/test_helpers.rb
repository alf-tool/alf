require 'alf'
require 'rspec'
require 'sap'

ENV['DATABASE'] ||= 'postgres'

module AlfIntegrationHelpers

  FIXTURES_FOLDER = Path.backfind('fixtures')

  DATABASE_ADAPTERS = {
    "fake"     => Alf.examples_adapter,
    "sqlite"   => FIXTURES_FOLDER/"suppliers-and-parts/suppliers-and-parts.db",
    "postgres" => "postgres://alf@localhost/suppliers_and_parts"
  }

  def fixtures_folder
    FIXTURES_FOLDER
  end

  def adapter
    DATABASE_ADAPTERS[ENV['DATABASE']]
  end

  def db
    Alf::Database.new(adapter, viewpoint: Sap::Views[])
  end

end

RSpec.configure do |c|
  c.include(AlfIntegrationHelpers)
end
