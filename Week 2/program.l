%{
int count=0;
%}

%%
\n  {count++;fprintf(yyout,"\n%d",count);}
\/\*(.|\n)*\*\/   {fprintf(yyout,"");}
\n[\n]+    {fprintf(yyout,"\n");}
\t[\t]+ {fprintf(yyout,"");}
[ \t]+  {fprintf(yyout," ");}
.   {fprintf(yyout,"%s",yytext);}
%%

int yywrap(void)
{
    return 1;
}

int main()
{
    extern FILE *yyin, *yyout; 
    yyin = fopen("in.c", "r");
    yyout = fopen("out.c","w");
    yylex();
    return 0;
}