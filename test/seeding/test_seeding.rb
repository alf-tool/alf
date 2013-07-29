require 'test_helpers'
describe "Seeding with a complete folder" do
pending do
  let(:db_opts){
    opts.merge(migrations_folder: fixtures_folder/"suppliers-and-parts/migrations")
  }

  let(:db){
    Alf.database(victim.conn_spec,db_opts)
  }

  let(:conn){
    db.connection
  }

  before do
    conn.migrate!
    conn.knows?(:suppliers).should be_true
  end

  after do
    conn.close if conn
  end

  context 'when no seeds folder is set' do

    let(:opts){ {} }

    it 'fails with a clear message' do
      lambda{
        db.connect{|conn| conn.seed!(:base) }
      }.should raise_error(Alf::ConfigError, /No seeds folder set/)
    end
  end

  context 'when a seeds folder is set' do

    let(:opts){
      { seeds_folder: fixtures_folder/"suppliers-and-parts/seeds" }
    }

    it 'seeds the database when a seed name is provided' do
      conn.seed!
      conn.query{ suppliers }.size.should eq(5)
    end
  end

end
end
