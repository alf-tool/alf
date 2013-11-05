require 'test_helpers'
describe Alf, "Tuple" do

  it 'supports no attribute at all' do
    lambda{
      Tuple()
    }.should_not raise_error
  end

end
