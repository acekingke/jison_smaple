%start ALL_QUERIES

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
        SELECT COLUMN_NAMES 
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
VALUE:
        STRING
        {
          $$ = yytext;
        }
        ;
      

       

%%