require "test_helper"

require_relative '../lib/dgraphy/mutate_builder'

class MutateBuilderTest < Minitest::Test
  def test_building_mutate
    m = Dgraphy::MutateBuilder.new
    m.raw_field('_:hi <Name> "Hello" .')
    m.raw_field('_:hi <Age> 23 .')

    expected = "{set{_:hi <Name> \"Hello\" .\n_:hi <Age> 23 .\n}}"
    assert_equal(expected, m.to_s)
  end
end
