$:.unshift File.expand_path("../../", __FILE__)
require "minitest/autorun"
require "test/unit"
require "stringio"

class Minitest::Test
  def capture_streams
    out = StringIO.new
    $stdout = out
    $stderr = out
    yield
    out.rewind
    out.read
  ensure
    $stdout = STDOUT
    $stderr = STDERR
  end
  
  def assert_prints(expected, &block)
    assert_equal expected, capture_streams(&block)
  end
end