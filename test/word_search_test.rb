require 'simplecov'
SimpleCov.start

require './lib/word_search'
require 'minitest/autorun'
require 'minitest/pride'

class WordSearchTest < Minitest::Test
  include WordSearch

  def setup
    @dictionary ||= File.read("/usr/share/dict/words")
    @response = "Verb: GET
    Path: /word_search?word=manatee
    Protocol: HTTP/1.1
    Host: localhost:9292
    Connection: keep-alive
    Cache-Control: max-age=0
    Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
    Upgrade-Insecure-Requests: 1
    User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36
    Accept-Encoding: gzip, deflate, sdch
    Accept-Language: en-US,en;q=0.8,es;q=0.6
    Cookie: _test_app_session=ODViUXU1R0lScmRQeFY0TWtFcndGbGdWMVdYREhyeUQvYzhwdVBOM3J6RzlMOWJ2Z01WMytyRDlrVE4zU0FPdEpBYzBqTGNNMW1oK0IyVm02eHpOQ29NOGxrOUpYSUhhcHN3My9HcGszVWVzNlBpWFhacnVRNzJRaUxacG4rUjJsbFNPS0tKeWtGN3llb2NQQmkrVE94S01NSmxrRm9sNXA4OG5JN2tHMzBWK0pxbXNha1AvOUUrNk00algwZHdOeWRXVnJLN2JSMXQ0Y2E3dmNLQkFXd3VONFRYZGg3OFFsUzN0Sll1bzkrbWRhdVlCMzZTRDZ1bUE4SnZ1c3krUG5ZUy9rRnpSVWdwZllxL1ZrTGlHREE9PS0ta0d6Q0RHeWhoVkUxUjBKRkNxdHdHZz09--0649cb9691b5c2049330e67b56ad7f3b002f96da"

  end

  def test_word_isolates_word
    # include WordSearch
    assert_equal "manatee", @response.word
  end
end
