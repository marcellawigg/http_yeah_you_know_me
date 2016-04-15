class PersistentState

  attr_accessor :hello_counter, :request_counter, :close,
  :game, :guess_count, :guess, :random_number, :header,
   :response_code, :body, :redirect

  def initialize
    @hello_counter = 0
    @request_counter = 0
    @close = false
    @guess_count =  0
    @game = false
    @random_number = rand(0..100)
    @guess = nil
    # @header = "HTTP/1.1" + @response_code
    @header = nil
    @body = nil
    @response_code = "200 OK"
    @redirect = nil
  end


end
