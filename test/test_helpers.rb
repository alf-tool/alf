require 'alf'
require 'rspec'

module Alf::IntegrationTestHelpers

  def fixtures_folder
    Path.backfind("fixtures")
  end

end

RSpec.configure do |c|
  c.include(Alf::IntegrationTestHelpers)
end