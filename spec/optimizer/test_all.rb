require 'test_helpers'

Path.dir.glob('*').select{|f| f.directory? }.each do |folder|
  optimizer = Alf::Optimizer.const_get(folder.basename.to_s.capitalize)

  describe optimizer do

    folder.glob('*.yml').each do |file|
      context "On #{file.basename}" do

        file.load.each do |query|
          alf, optimized = query['alf'], query['optimized']

          context "on #{alf}" do
            let(:expr)    { conn.parse(alf)       }
            let(:expected){ conn.parse(optimized) }

            subject{ optimizer.new.call(expr) }

            it 'should be optimized as expected' do
              subject.should eq(expected)
            end

            it 'should have same heading as the initial expression' do
              subject.heading.should eq(expr.heading)
            end
          end
        end

      end
    end
  end

end
