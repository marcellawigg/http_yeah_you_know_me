require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/output'
require './lib/persistent_state'

class OutputTest < Minitest::Test

  def setup
    @ps = PersistentState.new
    @response = ["POST / HTTP/1.1",
   "Host: localhost:9292",
   "Connection: keep-alive",
   "Content-Length: 2",
   "Cache-Control: no-cache",
   "Origin: chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop",
   "Content-Type: text/plain;charset=UTF-8",
   "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36",
   "Postman-Token: 9cc45243-9ab9-c938-50c3-95e63fefb829",
   "Accept: */*",
   "Accept-Encoding: gzip, deflate",
   "Accept-Language: en-US,en;q=0.8,es;q=0.6"]
    @output = Output.new(@response, @ps)
  end

  def test_it_isolates_path
    assert_equal "/", @output.path_outputs
  end


end
