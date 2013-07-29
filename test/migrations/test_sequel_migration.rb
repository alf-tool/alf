require 'test_helpers'
describe "Migrations with a Sequel adapter" do

  let(:db){
    Alf.database("#{Alf::Sequel::Adapter.sqlite_protocol}:memory", opts)
  }

  context 'when no migration folder is set' do

    let(:opts){ {} }

    it 'fails with a clear message' do
      lambda{
        db.connect{|conn| conn.migrate! }
      }.should raise_error(Alf::ConfigError, /Migrations folder not set/)
    end
  end

  context 'when a migration folder is set' do

    let(:opts){
      { migrations_folder: fixtures_folder/"suppliers-and-parts/migrations" }
    }

    it 'runs the migrations' do
      db.connect do |conn|
        conn.knows?(:suppliers).should be_false
        conn.migrate!
        conn.knows?(:suppliers).should be_true
      end
    end
  end

end
