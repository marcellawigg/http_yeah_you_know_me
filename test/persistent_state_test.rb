require 'simplecov'
SimpleCov.start

require './lib/persistent_state'
require 'minitest/autorun'
require 'minitest/pride'

class PersistentStateTest < Minitest::Test

  def setup
    @ps = PersistentState.new
  end

  def test_hello_counter_is_default_zero
    assert_equal 0, @ps.hello_counter
  end

  def test_request_counter_is_default_zero
    assert_equal 0, @ps.request_counter
  end

  def test_close_is_default_false
    assert_equal false, @ps.close
  end
end
