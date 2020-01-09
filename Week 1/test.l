letter [A-Za-z0-9]
%{
 #include <stdlib.h>    
 int count;
%}
%%
 /* match words */
{letter}+ {count++;}
\n {return 1;}
%%
int main(void) {
 yylex();
 printf("Number of Words = %d\n", count);
 return 0;
} 