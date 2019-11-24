/* simplest version of calculator */

%{
#  include <stdio.h>
#  include <stdlib.h>
int yylex();
void yyerror(char *s);
void printRoman(int num){
    if(num==0){
        printf("Z\n");
    } else {
        if (num < 0){
            printf("-");
            num *= -1;
        }
        while(num != 0)
        {
        
            if (num >= 1000)
            {
            printf("M");
            num -= 1000;
            }
    
            else if (num >= 900)
            {
            printf("CM");
            num -= 900;
            }        
    
            else if (num >= 500)
            {           
            printf("D");
            num -= 500;
            }
    
            else if (num >= 400)
            {
            printf("CD");
            num -= 400;
            }
    
            else if (num >= 100)
            {
            printf("C");
            num -= 100;                       
            }
    
            else if (num >= 90)
            {
            printf("XC");
            num -= 90;                                              
            }
    
            else if (num >= 50)
            {
            printf("L");
            num -= 50;                                                                     
            }
    
            else if (num >= 40)
            {
            printf("XL");           
            num -= 40;
            }
    
            else if (num >= 10)
            {
            printf("X");
            num -= 10;           
            }
    
            else if (num >= 9)
            {
            printf("IX");
            num -= 9;                         
            }
    
            else if (num >= 5)
            {
            printf("V");
            num -= 5;                                     
            }
    
            else if (num >= 4)
            {
            printf("IV");
            num -= 4;                                                            
            }
    
            else if (num >= 1)
            {
            printf("I");
            num -= 1;                                                                                   
            }
        
        }
        printf("\n");
        }
}
%}

/* declare tokens */
%token PLUS MINUS MUL DIV OB CB
%token I IV V IX X XL L XC C CD D CM M
%token EOL
%token ERROR

%%
evaluation: /* nothing */
 | evaluation exp EOL { printRoman($2); }
 ; 

exp: factor {$$ = $1;}
 | exp PLUS factor {$$ = $1 + $3;}
 | exp MINUS factor {$$ = $1 - $3;}
;

factor: number {$$ = $1;}
 | factor MUL number {$$ = $1 * $3;}
 | factor DIV number {$$ = $1 / $3;}
 ;

number: numeral {$$ = $1;}
  |number numeral { $$ = $1 + $2;}
  | OB exp CB {$$ = $2;}
  | OB exp {yyerror("syntax error");}
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