require 'simplecov'
SimpleCov.start

require './lib/persistent_state'
require 'minitest/autorun'
require 'minitest/pride'

class PersistentStateTest < Minitest::Test
1 unless request_lines[0].include?("favicon")
