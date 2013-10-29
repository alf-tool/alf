require 'test_helpers'
describe Alf::Algebra::Ungroup, "on json content" do

  it 'works as expected' do
    Alf.connect(Path.dir) do |conn|
      rel = conn.relvar{ ungroup(grouped, :suppliers) }.to_a
      rel.should eq([{sid: "S1"}])
    end
  end

end
