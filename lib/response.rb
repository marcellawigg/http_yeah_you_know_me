class Response
  attr_reader :response

  def initialize(request_lines)
    # @response
  end

  def request_to_nested_array(request_lines)
    request_lines.map { |line| line.split(": ") }
  end

  def shifts_array(request_lines)
    request_lines.shift
  end

  

end
