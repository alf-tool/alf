require 'test_helpers'
describe Path, "the .rash registered loader" do

  let(:expected){
    [{sid: "S1", name: "Smith"}]
  }

  subject{ (Path.dir/"suppliers.rash").load }

  it{ should eq(expected) }

end