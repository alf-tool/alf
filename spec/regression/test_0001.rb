require 'test_helpers'
describe Alf do

  it 'should allow joining with an empty projection' do
    db.connect do |conn|
      rel = conn.query{ join(suppliers, project(suppliers, [])) }
      exp = conn.query{ suppliers }
      rel.should eq(exp)
    end
  end

end
