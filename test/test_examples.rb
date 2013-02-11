require 'test/unit'
require 'alf'
class TestExamples < Test::Unit::TestCase

  (Path.dir/'../examples/ruby').glob('**/*.rb') do |rb|
    name = rb.rm_ext.basename.to_s.gsub(/\-/, '_')

    define_method("test_#{name}".to_sym) do
      eval(rb.read, binding)
    end
  end

end