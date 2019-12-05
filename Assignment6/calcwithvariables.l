%{
# include "romcalc.tab.h"
# include <stdlib.h>

void yyerror(char *s);
%}

%%
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MUL; }
"/"     { return DIV; }
"{"     { return OB;}
"}"     { return CB;}
":="    { return ASSIGN;}
"print" { return PRINT;}

\n      { return EOL; }
[ \t]   { /* ignore white space */ }
.	{ yyerror("syntax error");}
%%

