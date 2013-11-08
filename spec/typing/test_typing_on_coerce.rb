require 'test_helpers'
describe Alf, "resulting type on coerce" do

  it 'should use the coerced info' do
    db.connect do |conn|
      rel = conn.query{
        project(coerce(suppliers, status: Integer), [:status])
      }
      exp = Relation[status: Integer]
      rel.class.should eq(exp)
    end
  end

end
