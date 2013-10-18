require 'test_helpers'
describe Alf, "query" do

  subject{ Alf.query(adapter){ suppliers } }

  it{ should be_a(Relation) }

  it 'should have expected heading' do
    subject.heading.should eq(Heading(sid: String, name: String, status: Integer, city: String))
  end

end
