%s FROM_CLAUSE REGEX_CONDITION
%x IN_REGEX

%%
"merge"	 return 'MERGE';
'list' 	 {return 'LIST';}
'series' 	 {return 'SERIES'}
'continuous query' 	 {return 'CONTINUOUS_QUERY'}
'continuous queries' 	 {return 'CONTINUOUS_QUERIES'}
'inner' 	 {return 'INNER'}
'join' 	 {return 'JOIN'}
'from' 	 {this.begin("FROM_CLAUSE"); return 'FROM'}
<FROM_CLAUSE,REGEX_CONDITION>\/ { this.begin("IN_REGEX");   }

<IN_REGEX>\\\/ %{
   
%}
<IN_REGEX>\\ %{
  
%}
<IN_REGEX>\/ %{
  this.begin("INITIAL");
  console.log("-----------xxxxxxx", yytext);
  return "REGEX_STRING";
%}
<IN_REGEX>\/i {
  this.begin("INITIAL");
  return "INSENSITIVE_REGEX_STRING";
}

<IN_REGEX>[^\\/]*  %{ 
  console.log("-----------vvvvvvvv", yytext);
  return "REGEX_STRING";
%}

"where"                   { this.begin('INITIAL'); return "WHERE"; }
'as' 	 return 'AS'
'select' 	 return 'SELECT'
'explain' 	 return 'EXPLAIN'
'delete' 	 return 'DELETE'
'drop series' 	{this.begin('INITIAL'); return 'DROP_SERIES';}
'drop' 	 return 'DROP'
'limit' 	 return 'LIMIT'
'order' 	 return 'ORDER'
'asc' 	 return 'ASC'
'in' 	 return 'IN'
'desc' 	 return 'DESC'
'group'  return 'GROUP'
'by' 	 return 'BY'
'into' 	 return 'INTO'
'(' 	 return yytext
')' 	 return yytext
'+' 	 return yytext
'-' 	 return yytext
'*' 	 return yytext
'/' 	 return yytext
'and' 	 return 'AND'
'.'      { return yytext; }
'or' 	 return 'OR'
'=~' 	 return 'REGEX_OP'
'=' 	 return 'OPERATION_EQUAL'
'!~' 	 return 'NEGATION_REGEX_OP'
'<>' 	 return 'OPERATION_NE'
'<' 	 return 'OPERATION_LT'
'>' 	 return 'OPERATION_GT'
'<=' 	 return 'OPERATION_LE'
'>=' 	 return 'OPERATION_GE'
";"                      { return yytext; }
\s+         {/* skip whitespace */}

(['](\\.|[^']|\\\')*?['])+                  	return 'STRING'
([0-9]+|[0-9]*\.[0-9]+|[0-9]+\.[0-9]*)[usmhdw]    {  return 'DURATION'; }
[0-9]*\.[0-9]+|[0-9]+\.[0-9]*   				 {  return 'FLOAT_VALUE'; }
[a-zA-Z0-9_][a-zA-Z0-9._-]*  					{ return "SIMPLE_NAME"; }
[:\[a-zA-Z0-9_][:\[\]a-zA-Z0-9._-]*   			{return  "INTO_NAME";}
'<*><<EOF>>' 	 return 'EOF'
%%