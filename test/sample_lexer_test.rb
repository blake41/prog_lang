require 'pry'
require 'pry-nav'
require_relative "../lexer"
code = <<-CODE
        def method(a, b):
          true
        CODE

ast = Lexer.new.tokenize(code)

binding.pry