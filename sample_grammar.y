class Parser

# We need to tell the parser what tokens to expect. So each type of token produced
# by our lexer needs to be declared here.
  token IF
  token DEF
  token CLASS
  token NEWLINE
  token NUMBER
  token STRING
  token TRUE FALSE NIL
  token IDENTIFIER
  token CONSTANT
  token INDENT DEDENT

  prechigh
    left  '.'
    right '!'
    left  '*' '/'
    left  '+' '-'
    left  '>' '>=' '<' '<='
    left  '==' '!='
    left  '&&'
    left  '||'
    right '='
    left  ','
  preclow

  rule
    # First, parsers are dumb, we need to explicitly tell it how to handle empty
    # programs. This is what the first rule does. Note that everything between `/* ... */` is
    # a comment.
    # Program:
    #   # /* nothing */                      { result = Nodes.new([]) }
    #   # this really only protects us from blank
    #   | Expressions                        { result = val[0] }
    # ;

    Expressions:
      Expression '+' Expression { result = val[0] << val[2] }
    ;

    Expression:
      Literal
    ;

    Literal:
      NUMBER  
      | STRING                      
    ;
end

# The final code at the bottom of this Racc file will be put as-is in the generated `Parser` class.
# You can put some code at the top (`header`) and some inside the class (`inner`).
---- header
  require "lexer"
  require "nodes"

---- inner
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.tokenize(code) # Tokenize the code using our lexer
    puts @tokens.inspect if show_tokens
    do_parse # Kickoff the parsing process
  end
  
  def next_token
    @tokens.shift
  end