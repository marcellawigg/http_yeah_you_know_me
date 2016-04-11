gitrequire './lib/server'
require 'minitest/autorun'
require 'minitest/pride'

class ServerTest < Minitest::Test

  def test_it_listens_on_default_port
    assert_equal 9292, Server.new.tcp_server
  end


end
