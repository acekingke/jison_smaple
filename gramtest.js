let parser = require('./sample04').parser
let yy = parser.yy;
yy.Node = function (arg1, arg2) {
	// body...
	console.log("node");
}
let x = parser.parse("select 'X'")
console.log(x);