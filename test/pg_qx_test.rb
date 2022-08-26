require "test_helper"

class PgQxTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PgQx::VERSION
  end
end
