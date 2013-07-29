require 'test_helpers'
describe "Migrations with a folder adapter" do

  let(:db){
    Alf.database(Path.dir)
  }

  subject{
    db.connect{|conn| conn.migrate! }
  }

  it 'fails with an not supported error' do
    lambda{
      subject
    }.should raise_error(Alf::NotSupportedError, /Unable to migrate/)
  end

end
