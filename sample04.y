%start ALL_QUERIES

%left  OR
%left  AND
%left  <character> '+' '-'
%left  <character> '*' '/'
%%
ALL_QUERIES:
        QUERY
        {
          $$ = $1;
          yy.Node(0,1);
          return $$;
        }
		;

QUERY:
        SELECT_QUERY
    	{
    		$$ = $1;
    	}	
        ;
SELECT_QUERY:
        SELECT COLUMN_NAMES FROM_CLAUSE GROUP_BY_CLAUSE WHERE_CLAUSE LIMIT_AND_ORDER_CLAUSES INTO_CLAUSE
        {
 			$$ = {
                COLUMN: $2
 			};
        }
        ;
COLUMN_NAMES:
        VALUES 
        {
        	$$ = $1;
        }
        ;
FROM_CLAUSE:
        FROM TABLE_VALUE
        {

        }
        |
        FROM SIMPLE_TABLE_VALUE
        {

        }
        ;
TABLE_VALUE:
    SIMPLE_NAME_VALUE | TABLE_NAME_VALUE | REGEX_VALUE
    ;


SIMPLE_NAME_VALUE:
        SIMPLE_NAME
        {

        }
        ;
TABLE_NAME_VALUE:
        TABLE_NAME
        {

        }
        ;

VALUES:
        VALUE
        {
          $$ = [$1];
        }
        |
        VALUES ',' VALUE
        {
          $$.push($1);
          $$.push($3);
        }  
        ;
GROUP_BY_CLAUSE:
        GROUP BY VALUES
        {

        }
        |
        GROUP BY VALUES FUNCTION_CALL
        {

        }
        |
        {
          $$ = NULL;
        }
        ;
WHERE_CLAUSE:
        WHERE CONDITION
        {
          $$ = $2;
        }
        |
        {
          $$ = NULL;
        }
        ;
CONDITION:
        BOOL_EXPRESSION
        {

        }
        |
        '(' CONDITION ')'
        {
          $$ = $2;
        }
        |
        CONDITION AND CONDITION
        {

        }
        |
        CONDITION OR CONDITION
        {

        }
        ;
BOOL_OPERATION:
        OPERATION_EQUAL
        |
        OPERATION_NE
        |
        OPERATION_GT
        |
        OPERATION_LT
        |
        OPERATION_GE
        |
        OPERATION_LE
        ;
VALUE:
        STRING_VALUE
        {
          $$ = yytext;
        }
        |
        INT_VALUE
        {

        }
        |
        FLOAT_VALUE
        {

        }
        |
        DURATION_VALUE
        |
        SIMPLE_NAME_VALUE
        |
        WILDCARD
        |
        TABLE_NAME_VALUE
        |
        FUNCTION_CALL
        |
        '(' VALUE ')'
        {

        }
        |
        VALUE '*' VALUE {}
        |
        VALUE '/' VALUE {  }
        |
        VALUE '+' VALUE { }
        |
        VALUE '-' VALUE {}
        ;
      

       

%%