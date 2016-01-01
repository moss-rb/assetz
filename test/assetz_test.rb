require 'test_helper'

class AssetzTest < Minitest::Test
  def test_version_number_exists
    refute_nil ::Assetz::VERSION
  end
end
