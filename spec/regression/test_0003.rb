require 'test_helpers'
describe Alf do

  it 'should meet union/intersect priorities' do
    db.connect do |conn|
      rel = conn.query{
        r1 = union(
               restrict(suppliers, city: 'Paris'), 
               restrict(suppliers, city: 'London'))
        r2 = restrict(suppliers, gt(:status, 20))
        intersect(r1, r2)
      }
      exp = conn.query{
        restrict(suppliers, sid: 'S3')
      }
      rel.should eq(exp)
    end
  end

end
