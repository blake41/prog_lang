load "lexer.rb"
require 'debugger'

code = <<-CODE
class Awesome:
  def name:
    "I'm Awesome"

  def awesomeness:
    100

awesome = Awesome.new 
print(awesome.name) 
print(awesome.awesomeness)
CODE

tokens = Lexer.new.tokenize(code)
debugger
puts 'hi'