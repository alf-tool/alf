require 'test_helpers'
describe Alf, "query" do

  subject{ Alf.query(adapter){ suppliers } }

  it{ should be_a(Relation) }

  it 'should have expected heading' do
    subject.heading.should eq(Heading(sid: String, name: String, status: Integer, city: String))
  end

  it 'should have all tuples of exact same class' do
    clazz = nil
    subject.each do |tuple|
      clazz ||= tuple.class
      tuple.class.object_id.should eq(clazz.object_id)
    end
    clazz.should_not be_nil
  end

end
