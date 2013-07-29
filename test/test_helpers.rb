require 'alf'
require 'rspec'

module Alf::IntegrationTestHelpers

  def fixtures_folder
    Path.backfind("fixtures")
  end

  class Victim

    def conn_spec
      ENV['ALF_VICTIM_CONN_SPEC'] || "#{Alf::Sequel::Adapter.sqlite_protocol}:memory"
    end
  end

  def victim
    @victim ||= Victim.new
  end
end

RSpec.configure do |c|
  c.include(Alf::IntegrationTestHelpers)
end