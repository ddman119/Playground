%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern void yyerror(char*);
%}

%union {
  int int_token;
}

%token <int_token> NORTH SOUTH EAST WEST

%start root_node

%%

root_node: north_node | south_node | east_node | west_node;

north_node: NORTH { printf("Parsed North node\n"); };
south_node: SOUTH { printf("Parsed South node\n"); };
east_node: EAST { printf("Parsed East node\n"); };
west_node: WEST { printf("Parsed West node\n"); };
