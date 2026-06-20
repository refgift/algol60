LABELDECL	[A-Z]+[0-9]*":"
LABEL		[A-Z]+[0-9]*
BG		[ \t\n]
ARITMETICS	[+-/*]
CONDITIONALS  	[<>!=]
BOOLEAN		TRUE|FALSE
DIGIT		[0-9]
LETTER		[A-Z]
%{
	static char label[256];
	static char text1[256];
	static char text2[256];
	static char text3[256];
	static char text4[256];
%}

%%
{BG}*OUTPUT{BG}+\".+\"		{
					bzero(text1,256);
					sscanf(yytext," OUTPUT \"%256c\"", text1);
					printf("	printf\(\"%%s \",\" %s);\n",text1);
					}

{BG}*OUTPUT{BG}+{LABEL}+		{
					sscanf(yytext," OUTPUT %s", label);
					printf("	printf\(\"%%d \", %s);\n",label);
				}
{BG}*INPUT{BG}+{LABEL}+		{
					sscanf(yytext," INPUT %s", label);
					printf("	scanf\(\"%%d\", &%s);\n",label);
				}

{BG}*INTEGER{BG}+{LABEL}+	{
					sscanf(yytext," INTEGER %s", label);
					printf("int %s;\n", label);
				}
{BG}*IF{BG}*.+{BG}*THEN+	{
					bzero(text1,256);
					bzero(text2,256);
					bzero(text3,256);					
					sscanf(yytext," IF %s %s %s THEN", text1, text2 , text3);
					printf("	if ( %s %s %s )", text1,text2,text3);
				}
{BG}*{LABEL}+{BG}*:={BG}*({LETTER}|{DIGIT})+{BG}*{ARITMETICS}*{BG}*({LETTER}|{DIGIT})*	{
					bzero(text1,256);
					bzero(text2,256);
					bzero(text3,256);
					bzero(text4,256);					
					int s = sscanf(yytext, "%s := %s %s %s", text1, text2, text3 ,text4);
					//printf("%s Scan Count: %d\n",yytext, s);
					printf("\t%s=%s %s %s ; \n",text1, text2, text3 , text4);
				}

{BG}*BEGIN		printf("{\n");
{BG}*END		printf("}\n");
{BG}*GOTO{BG}+{LABEL}+	{ 
				sscanf(yytext," GOTO %s", label); 
				printf("	{ asm(\"pause\");goto %s;}\n", label); 
			}
^{LABELDECL}		printf("%s\n",yytext);
{BG}*			;
";"			;
.			printf("?");
%%
int main(void) 
{
	printf("/* first Generated C code */\n");
	printf("#include <stdlib.h>\n");
	printf("#include <stdio.h>\n");
	printf("int main(void) {\n");
	yylex();
	printf("	return(0);\n");
	printf("}\n");	
	return (0);
}