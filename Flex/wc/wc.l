%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+   { words++; chars += strlen(yytext); }
\n          { chars++; lines++; }
.           { chars++;}

%%

int main(void) {
  yylex();
  printf("Lines: %d\nWords: %d\nCharacters: %d\n", lines, words, chars);
}
