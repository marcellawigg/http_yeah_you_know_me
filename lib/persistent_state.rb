class PersistentState

  attr_accessor :hello_counter, :request_counter, :close

  def initialize
    @hello_counter = 0
    @request_counter = 0
    @close = false
  end


end
