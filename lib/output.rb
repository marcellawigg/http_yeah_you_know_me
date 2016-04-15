require './lib/response_parser'
require './lib/word_search'
require './lib/response_codes'
require './lib/number_search'

class Output
  include WordSearch
  include ResponseCodes
  include NumberSearch

  attr_reader :path, :hello_counter, :response, :ps, :verb

  def initialize(response, ps)
    @path = response.path
    @verb = response.verb
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
    when path == "/start_game"
      ps.game = true
      output_game_start
    when path == "/game" && verb == "POST"
      game_post
    when path == "/game" && verb == "GET"
      number_comparison
    end
  end

  def output_root
    "<html><head></head><body><p><pre>
        Verb: #{response.verb}
        Path: #{response.path}
        Protocol: #{response.protocol}
        Host: #{response.host}
        Port: #{response.port}
        Origin: 127.0.0.1
        Accept: text/html,application/xhtmlxml,application/xml;q=0.9,image/webp,*/*;q=0.8</pre></p></body></html>"
  end

  def output_hello
    "<html><head></head><body>Hello World! (#{ps.hello_counter})</body></html>"
  end

  def output_datetime
    "<html><head></head><body><p><pre>#{Time.now.strftime("%l:%M%p on %A, %B %d, %Y")}</pre></p></body></html>"
  end

  def output_shutdown
    "<html><head></head><body><p><pre>Total Requests: #{ps.request_counter} </pre></p></body></html>"
  end

  def output_game_start
    "<html><head></head><body>Good Luck!</body></html>"
  end

  def output_game
    "<html><head></head><body>You have taken #{ps.guess_count} guesses</body></hmtl>"
  end

  def game_post
    server = "HTTP/1.1 303 See Other\r\n"
    location = "Location: http://127.0.0.1:9292/game\r\n\r\n"
     server + location
  end

end
