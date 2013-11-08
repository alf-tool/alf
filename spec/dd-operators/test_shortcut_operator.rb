require 'test_helpers'
describe Alf, "the ability to define shortcut operators" do

  class MyShortcutOperator
    include Alf::Algebra::Shortcut
    include Alf::Algebra::Unary

    def expand
      allbut(rename(operand, foo: :bar), [:bar])
    end
  end

  it 'works as expected' do
    input = Relation(foo: 12, baz: 13)
    expected = Relation(baz: 13)
    input.my_shortcut_operator.should eq(expected)
  end

end
