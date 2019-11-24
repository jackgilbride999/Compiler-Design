%{
int i = 0;
%}
	
%%
	
\"[^"]*\"	{ printf("%s", yytext); }
\*\*.*		{ i++; }
\{\}		{ i++;}
[\{][^}]*[\}]	{ i++;}
[\{][^}]*	{ printf("syntax error\n"); return -1;}
\}		{ printf("syntax error\n"); return -1;}


%%

int main()
{
  yylex();
  return 0;
}