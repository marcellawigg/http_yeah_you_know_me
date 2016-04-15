class PersistentState

  attr_accessor :hello_counter, :request_counter, :close,
  :game, :guess_count, :guess, :random_number, :header, :response_code

  def initialize
    @hello_counter = 0
    @request_counter = 0
    @close = false
    @guess_count =  0
    @game = false
    @random_number = rand(0..100)
    @guess = nil
    @header = nil
    @response_code = "200 OK"
  end


end
