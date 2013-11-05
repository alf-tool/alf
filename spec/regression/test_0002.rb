require 'test_helpers'
describe Alf do

  it 'should support projecting over no attribute' do
    db.connect do |conn|
      rel = conn.query{ project(suppliers, []) }
      exp = Relation::DEE
      rel.should eq(exp)
    end
  end

end
