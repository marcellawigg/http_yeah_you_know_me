require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/output'

class OutputTest < Minitest::Test

  def test_it_outputs_root
    @path = "/"
    assert_equal output_root,path_outputs(@path)
  end

  
end
