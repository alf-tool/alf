require 'test_helpers'
module Alf
  module Algebra
    describe Image do

      context 'on sap' do

        subject{
          db.connect do |c|
            c.query{ image(suppliers, supplies, :supplying) }
          end
        }

        it{ should be_a(Relation) }

        it 'should have all suppliers' do
          subject.size.should eq(5)
        end

        it 'should have the supplying attr' do
          subject.each do |tuple|
            tuple.supplying.should be_a(Relation)
            if tuple.sid == 'S5'
              tuple.supplying.should be_empty
            end
          end
        end

      end

    end
  end
end
