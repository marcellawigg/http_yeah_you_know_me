require './lib/response_parser'
require './lib/word_search'
require './lib/response_codes'
require './lib/number_search'
require './lib/server'

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

  def path_outputs(client)
    ps.request_counter += 1
    case
    when path == "/"
      # run_code(client)
      ps.body = output_root
    when path == "/hello"
      ps.hello_counter += 1
      # run_code(client)
      ps.body = output_hello
    when path == "/datetime"
      # run_code(client)
      ps.body = output_datetime
    when path == "/shutdown"
      # run_code(client)
      ps.close = true
      ps.body = output_shutdown
    when path.include?("word_search")
      # run_code(client)
      ps.body = output_word(path)
    when path == "/start_game" #fix
      new_game?(client)
      ps.game = true
      ps.body = output_game_start
    when path == "/game" && verb == "POST"
      ps.body = game_post(client)
    when path == "/game" && verb == "GET"
      ps.body = number_comparison
    else
      not_found(client)
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

  # def run_code(client)
  #   client.puts ok_code
  # end

  def not_found(client)
    client.puts not_found_code
  end


end
