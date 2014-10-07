code = <<-CODE
        def method(a, b):
          true
        CODE
# lexer output from lexer.rb not bracket_lexer

[[:DEF, "def"], [:IDENTIFIER, "method"], ["(", "("], [:IDENTIFIER, "a"], 
  [",", ","], [:IDENTIFIER, "b"], [")", ")"], [:INDENT, 10], [:TRUE, "true"], [:DEDENT, 0]]

# parser output
nodes = Nodes.new([
  DefNode.new("method", ["a", "b"],
    Nodes.new([TrueNode.new])
  )
])

Im going to assume the result stack functions like an array
nothing matches so we apply /* nothing */ { result = Nodes.new([]) }
stack = [Nodes.new([])]
tokens = [[:DEF, "def"], [:IDENTIFIER, "method"], ["(", "("], [:IDENTIFIER, "a"], 
  [",", ","], [:IDENTIFIER, "b"], [")", ")"], [:INDENT, 10], [:TRUE, "true"], [:DEDENT, 0]]
DEF IDENTIFIER "(" IDENTIFIER "," IDENTIFIER
IDENTIFIER "," IDENTIFIER matches for Paramlist so we apply { result = val[0] << val[2] }
parse_stack = [IDENTIFIER, ",", IDENTIFIER, "(", IDENTIFIER, DEF]
value stack = ["b", ",", "a", "(", "method", "def"]
# pop off top three and push back on ["b", "a"]
value stack = [["b","a"], "(", "method", "def"]
parse stack = [Paramlist, "(", IDENTIFIER, DEF]
DEF IDENTIFIER "(" Paramlist
DEF IDENTIFIER "(" Paramlist ")" INDENT TRUE
TRUE matches for Literal so we apply { result = TrueNode.new }
value stack = [TrueNode.new, \n ,")", ["b","a"], "(", "method", "def"]
parse_stack = [Literal, INDENT, ")", Paramlist, "(", IDENTIFIER, DEF]
DEF IDENTIFIER "(" Paramlist ")" INDENT Literal
Literal reduces to Expression with no rule to apply
value stack = [TrueNode.new, \n ,")", ["b","a"], "(", "method", "def"]
parse_stack = [Expression, INDENT, ")", Paramlist, "(", IDENTIFIER, DEF]
DEF IDENTIFIER "(" Paramlist ")" INDENT Expression DEDENT
value stack = [dedent 0, TrueNode.new, indent 10 ,")", ["b","a"], "(", "method", "def"]
parse_stack = [DEDENT, Expression, INDENT, ")", Paramlist, "(", IDENTIFIER, DEF]
INDENT Expression DEDENT matches for Block so we apply { result = val[1] }
value stack = [TrueNode.new, ")", ["b","a"], "(", "method", "def"]
parse stack = [Block, ")", Paramlist, "(", IDENTIFIER, DEF]
DEF IDENTIFIER "(" Paramlist ")" Block
this matches for def so we apply { result = DefNode.new(val[1], val[3], val[5]) }
parse stack = [def]
# heres where im confused, val[1] and 3 and 5 are wrong. In my stack its val[4], val[2], val[0]
value stack = ?
Def
Def reduces to expression which has no rule to apply
parse stack = [Expression]
expression reduces to expressions which applies { result = Nodes.new(val) }
This must do something like Nodes.new(value_stack)