/* simplest version of calculator */

%{
#  include <stdio.h>
#  include <stdlib.h>
int yylex();
void yyerror(char *s);
%}

/* declare tokens */
%token I IV V IX X XL L XC C CD D CM M
%token EOL
%token ERROR

%%
evaluation: /* nothing */
 | evaluation exp EOL { printf("%d\n", $2); }
 ; 

exp: numeral {$$ = $1;}
  |exp numeral { $$ = $1 + $2;}
  ;

numeral: I {$$ = $1;}
  |IV {$$ = $1;}
  |V {$$ = $1;}
  |IX {$$ = $1;}
  |X {$$ = $1;}
  |XL  {$$ = $1;}
  |L {$$ = $1;}
  |XC {$$ = $1;}
  |C {$$ = $1;}
  |CD {$$ = $1;}
  |D {$$ = $1;}
  |CM {$$ = $1;}
  |M {$$ = $1;}
  |ERROR {yyerror("syntax error\n"); return 0;}
;

%%
int main()
{
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  fprintf(stderr, "%s\n", s);
  exit(0);
}






