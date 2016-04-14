require 'socket'
require 'pry'
require './lib/output'
require './lib/response_parser'
require './lib/persistent_state'

class Server
  attr_accessor :server

  def initialize
    # @line_counter = 0
    # @hello_counter = 0
    @ps = PersistentState.new
    @server = TCPServer.new(9292)
  end

  def start
    puts "Ready for a request"
    loop do
      client = server.accept

      request_lines = get_lines(client)
      response = ResponseParser.new(request_lines)
      output_object = Output.new(response, @ps)

      # headers = ["http/1.1 200 ok",
      #   "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
      #   "server: ruby",
      #   "content-type: text/html; charset=iso-8859-1",
      #   "content-length: #{output.length}\r\n\r\n"].join("\r\n")

      # client.puts headers
      client.puts output_object.path_outputs
      @hello_counter +=
      client.close if @ps.close
      end
    end

  def get_lines(client)
    request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    request_lines
  end

end


if __FILE__ == $0
  s = Server.new
  s.start
  # s.get_lines
end
