/* simplest version of calculator */

%{
#  include <stdio.h>
#  include <stdlib.h>
int yylex();
void yyerror(char *s);
int variables[26] = {0};
%}

/* declare tokens */
%token PLUS MINUS MUL DIV
%token ASSIGN PRINT SEMICOLON
%token ERROR
%token VARIABLE

%%
sentence: /* nothing */
 |  sentence assignment SEMICOLON { }
 |  sentence print SEMICOLON { }
 ; 

print: 
 |  PRINT var { printf("%d\n", variables[$2 - 'a']); }
;

assignment:
 |  var ASSIGN exp { variables[$2 - 'a' ] = $3; }
;

exp: factor {$$ = $1;}
 | exp PLUS factor {$$ = $1 + $3;}
 | exp MINUS factor {$$ = $1 - $3;}
;

factor: term {$$ = $1;}
 | factor MUL term {$$ = $1 * $3;}
 | factor DIV term {$$ = $1 / $3;}
 ;

term: NUMBER
 |  MINUS NUMBER {$$ = ($2*(-1));}
 |  VARIABLE {$$ = variables[($1) - 'a'];}
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