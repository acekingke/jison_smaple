var JisonLex = require('jison-lex');
var fs = require("fs");

var grammar = fs.readFileSync('sample04.l', 'utf8');

// generate source
var lexerSource = JisonLex.generate(grammar);

// or create a parser in memory
var lexer = new JisonLex(grammar);
let yy = {};
let o = null;
lexer.setInput('delete from foo where time < 1389040522000000u', yy);
o = lexer.lex();
while (o!= 1){
	console.log(o);
	o = lexer.lex();
}
console.log("---------------------");
lexer.setInput("select * from /zlig/", yy);
o = lexer.lex();
while (o!= 1){
	console.log(o);
	o = lexer.lex();
}
