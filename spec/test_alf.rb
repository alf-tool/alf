require 'test_helpers'
describe Alf do

  it "should have a version number" do
    Alf.const_defined?(:VERSION).should be_true
  end

end
