require 'socket'
require 'pry'

class Server
  attr_reader :port

  def initialize
    # @tcp_server = TCPServer.new 'test, 9292
  end

  def tcp_server(port=9292)
    TCPServer.new port
    port
  end


end
