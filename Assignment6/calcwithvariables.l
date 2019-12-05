%{
# include "calcwithvariables.h"
void yyerror(char *s);
%}

%%
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MUL; }
"/"     { return DIV; }
":="    { return ASSIGN;}
"print" { return PRINT;}
";"     { return SEMICOLON; }

[a-z]   {yyval = yytext[0] - 'a'; return VARIABLE;}
[0-9]+  {yyval = atoi(yytext); return NUMBER; }


\n      {}
[ \t]   { /* ignore white space */ }
.	{ yyerror("syntax error");}
%%

