#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require "lexer"
  require "nodes"

class Parser < Racc::Parser

module_eval(<<'...end sample_grammar.y/module_eval...', 'sample_grammar.y', 60)
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.tokenize(code) # Tokenize the code using our lexer
    puts @tokens.inspect if show_tokens
    do_parse # Kickoff the parsing process
  end
  
  def next_token
    @tokens.shift
  end
...end sample_grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     4,     5,     4,     5,     6,     8,     7 ]

racc_action_check = [
     0,     0,     7,     7,     1,     6,     2 ]

racc_action_pointer = [
    -6,     4,   -13,   nil,   nil,   nil,     5,    -4,   nil,   nil ]

racc_action_default = [
    -5,    -5,    -5,    -2,    -3,    -4,    -5,    -5,    10,    -1 ]

racc_goto_table = [
     2,     1,   nil,   nil,   nil,   nil,   nil,     9 ]

racc_goto_check = [
     2,     1,   nil,   nil,   nil,   nil,   nil,     2 ]

racc_goto_pointer = [
   nil,     1,     0,   nil ]

racc_goto_default = [
   nil,   nil,   nil,     3 ]

racc_reduce_table = [
  0, 0, :racc_error,
  3, 32, :_reduce_1,
  1, 33, :_reduce_none,
  1, 34, :_reduce_none,
  1, 34, :_reduce_none ]

racc_reduce_n = 5

racc_shift_n = 10

racc_token_table = {
  false => 0,
  :error => 1,
  :IF => 2,
  :DEF => 3,
  :CLASS => 4,
  :NEWLINE => 5,
  :NUMBER => 6,
  :STRING => 7,
  :TRUE => 8,
  :FALSE => 9,
  :NIL => 10,
  :IDENTIFIER => 11,
  :CONSTANT => 12,
  :INDENT => 13,
  :DEDENT => 14,
  "." => 15,
  "!" => 16,
  "*" => 17,
  "/" => 18,
  "+" => 19,
  "-" => 20,
  ">" => 21,
  ">=" => 22,
  "<" => 23,
  "<=" => 24,
  "==" => 25,
  "!=" => 26,
  "&&" => 27,
  "||" => 28,
  "=" => 29,
  "," => 30 }

racc_nt_base = 31

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "IF",
  "DEF",
  "CLASS",
  "NEWLINE",
  "NUMBER",
  "STRING",
  "TRUE",
  "FALSE",
  "NIL",
  "IDENTIFIER",
  "CONSTANT",
  "INDENT",
  "DEDENT",
  "\".\"",
  "\"!\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "\">\"",
  "\">=\"",
  "\"<\"",
  "\"<=\"",
  "\"==\"",
  "\"!=\"",
  "\"&&\"",
  "\"||\"",
  "\"=\"",
  "\",\"",
  "$start",
  "Expressions",
  "Expression",
  "Literal" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'sample_grammar.y', 39)
  def _reduce_1(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser
