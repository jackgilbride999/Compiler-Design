%{
  void printNumYears(){
    char* regex = yytext;
    int year = (regex[0]-'0')*10 + (regex[1]-'0');
    if(year<=87){
      printf("%i\n", 19-year);
    } else{
      printf("%i\n", 19+(100-year));
    }
 }
%}

YY ([8][7-9])|([9|0][0-9])|([1][1-2])
OLDYYY [1][3][12] 
CURRENTYYY ([1][4-9][1-2])|([2-9][0-9][1-2])  
OLDCC C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW
CURRENTCC C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
SSSSSS [0-9]{1,6}[ \t\n]+

%%

{YY}-{OLDCC}-{SSSSSS}	             { printNumYears(); }
{OLDYYY}-{OLDCC}-{SSSSSS}          { printNumYears(); }
{CURRENTYYY}-{CURRENTCC}-{SSSSSS}  { printNumYears(); }
.+[ \t\n]			                     { printf("INVALID\n"); }
\n		                             {}

%%

int main()
{
  yylex();
  return 0;
}