require './lib/response_parser'
class Output
  attr_reader :path, :hello_counter, :response, :ps

  def initialize(response, ps)
    @path = response.path
    @response = response
    @ps = ps
  end

  def path_outputs
    ps.request_counter += 1
    case path
    when "/"
      output_root
    when "/hello"
      ps.hello_counter += 1
      output_hello
    when "/datetime"
      output_datetime
    when "/shutdown"
      ps.close = true
      output_shutdown
    when "/word_search"
      
    end
  end

  def output_hello
    "<html><head></head><body>Hello World! (#{ps.hello_counter})</body></html>"
  end

  def output_root
    "<html><head></head><body><p><pre>#{response.string_output}</pre></p></body></html>"
  end

  def output_datetime
    "<html><head></head><body><p><pre>#{Time.now.strftime("%l:%M%p on %A, %B %d, %Y")}</pre></p></body></html>"
  end

  def output_shutdown
    "<html><head></head><body><p><pre>Total Requests: #{ps.request_counter} </pre></p></body></html>"
  end
end
