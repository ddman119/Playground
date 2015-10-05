%{
#include <stdio.h>
#include "directions.tab.h"
void yyerror(char*);
int yyparse(void);
%}

%%

"north" { printf("North\n"); return NORTH; }
"south" { printf("South\n"); return SOUTH; }
"east" { printf("East\n"); return EAST; }
"west" { printf("East\n"); return WEST; }
[ \t\n]+

%%

void yyerror(char *string) { printf("ERROR: Couldn't parse\n"); }
int yywrap(void) {}
int main(void) {
  yyparse();
}
