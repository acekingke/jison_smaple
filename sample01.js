var JisonLex = require('jison-lex');

var grammar = {
  rules: [
    ["x", "return 'X';" ],
    ["y", "return 'Y';" ],
    ["$", "return 'EOF';" ]
  ]
};

// or load from a file
// var grammar = fs.readFileSync('mylexer.l', 'utf8');

// generate source
var lexerSource = JisonLex.generate(grammar);

// or create a parser in memory
var lexer = new JisonLex(grammar);
lexer.setInput('xyxxy');
let o = lexer.lex();
console.log(o);
// => 'X'
o = lexer.lex();
// => 'Y'
console.log(o);