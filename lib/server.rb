require 'socket'
require 'pry'
require './lib/response'

class Server
  attr_accessor :server

  def initialize
    @line_counter = 0
    @counter = 0
    @server = TCPServer.new(9292)
  end

  def start
    puts "Ready for a request"
    loop do
      client = server.accept

      request_lines = get_lines(client)
      response = Response.new(request_lines)

      output_hello = "<html><head></head><body>Hello World! (#{@counter})</body></html>"
      output_root = "<html><head></head><body><p><pre>#{response.response}</pre></p></body></html>"
      output_datetime = "<html><head></head><body><p><pre>Time.now.strftime("%H:%M%p on %A, %B %d, %Y")</pre></p></body></html>"
      output_shutdown = "<html><head></head><body><p><pre>Total Requests: #{@line_counter} </pre></p></body></html>"

      headers = ["http/1.1 200 ok",
        "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
        "server: ruby",
        "content-type: text/html; charset=iso-8859-1",
        "content-length: #{output.length}\r\n\r\n"].join("\r\n")

      client.puts headers

      client.puts output
      @counter += 1 unless request_lines[0].include?("favicon")
        client.close
      end
    end

  def get_lines(client)
    request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
      @line_counter += 1
    end
    request_lines
  end

  def determine_output(path)
    case path
    when "/"



end


if __FILE__ == $0
  s = Server.new
  s.start
  # s.get_lines
end
