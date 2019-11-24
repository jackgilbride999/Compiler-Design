%{
 int count = 0;
%}

%%
	
[0-9]*[02468]+		{count++;}
[0-9]+			{}
\n			{}
.			{}
	
%%
int main()
{
 yylex();
 printf("%d\n", count);
 return 0;
}