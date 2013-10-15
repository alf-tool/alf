require 'test_helpers'

module SqlTestHelpers

  def each_query_file(&bl)
    (Path.dir/'queries').glob("*.yml", &bl)
  end

  def each_query(&bl)
    each_query_file do |file|
      queries = file.load
      queries.each(&bl)
    end
  end

  def strip(x)
    x.strip.gsub(/\s+/, " ").gsub(/\(\s+/, "(").gsub(/\s+\)/, ")")
  end

end

RSpec.configure do |c|
  c.include(SqlTestHelpers)
  c.extend(SqlTestHelpers)
end
