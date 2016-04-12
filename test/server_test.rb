require './lib/server'
require 'minitest/autorun'
require 'minitest/pride'
require 'faraday'
require 'pry'

class ServerTest < Minitest::Test
  attr_reader :conn
  def setup
    @conn = Faraday.new(:url => 'http://sushi.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

    # def test_it_listens_on_default_port
    #   assert_equal 9292, Server.new.tcp_server
    # end

    def test_it_returns_response
      @server = Server.new
      @server.tcp_server
      response = @conn.get "http://localhost:9292"
      binding.pry
    end


  end
