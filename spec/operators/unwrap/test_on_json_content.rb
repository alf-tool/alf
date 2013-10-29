require 'test_helpers'
describe Alf::Algebra::Unwrap, "on json content" do

  it 'works as expected' do
    Alf.connect(Path.dir) do |conn|
      rel = conn.relvar{ unwrap(wrapped, :wrapped) }.to_a
      rel.should eq([{sid: "S1"}])
    end
  end

end
