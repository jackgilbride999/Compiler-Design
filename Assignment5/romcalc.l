%{
# include "romancalc.tab.h"
#  include <stdlib.h>

void yyerror(char *s);
%}

%%
"I"	    { yylval = 1; return I; }
"IV"    { yylval = 4; return IV;}
"V"	    { yylval = 5; return V; }
"IX"    { yylval = 9; return IX;}
"X"	    { yylval = 10; return X;}
"XL"    { yylval = 40; return XL; }
"L"	    { yylval = 50; return L; }
"XC"    { yylval = 90; return XC; }
"C"     { yylval = 100; return C; }
"CD"    { yylval = 400; return CD; }
"D"     { yylval = 500; return D; }
"CM"    { yylval = 900; return CM; }
"M"     { yylval = 1000; return M; }
"CMCC"  { yyerror("syntax error");}
\n      { return EOL; }
[ \t]   { /* ignore white space */ }
.	{ yyerror("syntax error");}
%%

