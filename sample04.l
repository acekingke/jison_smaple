
%%
"merge"	 return 'MERGE';
'list' 	 {return 'LIST';}
'series' 	 {return 'SERIES'}
'continuous query' 	 {return 'CONTINUOUS_QUERY'}
'continuous queries' 	 {return 'CONTINUOUS_QUERIES'}
'inner' 	 {return 'INNER'}
'join' 	 {return 'JOIN'}
'from' 	 {return 'FROM'}
'as' 	 return 'AS'
'select' 	 return 'SELECT'
'explain' 	 return 'EXPLAIN'
'delete' 	 return 'DELETE'
'drop series' 	 return 'DROP_SERIES'
'drop' 	 return 'DROP'
'limit' 	 return 'LIMIT'
'order' 	 return 'ORDER'
'asc' 	 return 'ASC'
'in' 	 return 'IN'
'desc' 	 return 'DESC'
'group' 	 return 'GROUP'
'by' 	 return 'BY'
'into' 	 return 'INTO'
'(' 	 return yytext
')' 	 return yytext
'+' 	 return yytext
'-' 	 return yytext
'*' 	 return yytext
'/' 	 return yytext
'and' 	 return 'AND'
'or' 	 return 'OR'
'=~' 	 return 'REGEX_OP'
'=' 	 return 'OPERATION_EQUAL'
'!~' 	 return 'NEGATION_REGEX_OP'
'<>' 	 return 'OPERATION_NE'
'<' 	 return 'OPERATION_LT'
'>' 	 return 'OPERATION_GT'
'<=' 	 return 'OPERATION_LE'
'>=' 	 return 'OPERATION_GE'
\s+         {/* skip whitespace */}
'<*><<EOF>>' 	 return 'EOF'
(['](\\.|[^']|\\\')*?['])+                  	return 'STRING'
([0-9]+|[0-9]*\.[0-9]+|[0-9]+\.[0-9]*)[usmhdw]    {  return 'DURATION'; }
%%