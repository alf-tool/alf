require 'test_helpers'
module Alf
  describe "Key inference" do

    subject{ expr.keys }

    (Path.dir/"queries.yml").load.each do |query|
      alf  = query['alf']
      keys = query['keys']

      describe "Key inference on '#{query}'" do
        let(:expr){ conn.parse(alf) }

        it 'should be as expected' do
          subject.should eq(Alf::Keys.coerce(keys))
        end
      end
    end

  end
end