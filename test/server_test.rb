require './lib/server'
require 'minitest/autorun'
require 'minitest/pride'
require 'faraday'
require 'pry'

class ServerTest < Minitest::Test
  attr_reader :conn
  def setup
    @conn = Faraday.new(:url => 'http://localhost:9292')
  end

  def test_it_returns_response
    assert @conn
    assert @conn.get '/start_game'
      # req.body = "<html><head></head><body>Hello World! (#{ps.hello_counter})</body></html>"
  end

end
