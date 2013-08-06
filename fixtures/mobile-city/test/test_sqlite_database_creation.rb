require 'test_helper'
describe 'The creation of the sqlite database' do

  subject{ MobileCity.sqlite_database }

  it 'should succeed' do
    lambda{
      subject
    }.should_not raise_error
  end

end
