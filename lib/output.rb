require './lib/response_parser'
require './lib/word_search'

class Output
  include WordSearch
  attr_reader :path, :hello_counter, :response, :ps

  def initialize(response, ps)
    @path = response.path
    @response = response
    @ps = ps
    @dictionary ||= File.read("/usr/share/dict/words")
  end

  def path_outputs
    ps.request_counter += 1
    case
    when path == "/"
      output_root
    when path == "/hello"
      ps.hello_counter += 1
      output_hello
    when path == "/datetime"
      output_datetime
    when path == "/shutdown"
      ps.close = true
      output_shutdown
    when path.include?("word_search")
      output_word(path)
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
