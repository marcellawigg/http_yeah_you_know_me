class Output

  def initialize(path)
    @path = path
  end

  def path_outputs(path)
    case path
    when root?
      output_root
    when hello?
      output_hello
    when date?
      output_datetime
    when shutdown?
      output_shutdown
    end

    output_hello = "<html><head></head><body>Hello World! (#{@counter})</body></html>"
    output_root = "<html><head></head><body><p><pre>#{response.response}</pre></p></body></html>"
    output_datetime = "<html><head></head><body><p><pre>Time.now.strftime("%H:%M%p on %A, %B %d, %Y")</pre></p></body></html>"
    output_shutdown = "<html><head></head><body><p><pre>Total Requests: #{@line_counter} </pre></p></body></html>"

  end

  def root?
    true if @path == "/"
  end

  def hello?
    true if @path == "/hello"
  end

  def date?
    true if @path == "/datetime"
  end

  def shutdown?
    true if @path == "/shutdown"
  end

  # def output_hello
  #   "<html><head></head><body>Hello World! (#{@counter})</body></html>"
  # end
  #
  # def output_root     "<html><head></head><body><p><pre>#{response.response}</pre></p></body></html>"
  # end
  #
  # # def output_datetime
  # #   "<html><head></head><body>"Time.now.strftime("%H:%M%p on %A, %B %d, %Y")"</body></html>"
  # # end
  # #
  # def output_shutdown
  #   "<html><head></head><body><p><pre>Total Requests: #{@line_counter} </pre></p></body></html>"
  # end
end
