import java_cup.runtime.*;
%% 

%implements java_cup.runtime.Scanner
%type Symbol
%function next_token
%class  A4Scanner 
%state COMMENT
%eofval{ return null;
%eofval}

INTNUMBER = [0-9]+
REALNUMBER = [0-9]+(\.[0-9]+)
IDENTIFIER = [a-zA-Z][a-zA-Z0-9]*
QUOTE = \"([^\"]*)\" 
%%

<YYINITIAL>{QUOTE} {System.err.println(yytext()); return new Symbol(A4Symbol.QUOTE, new String(yytext()));}

<YYINITIAL>"/**" {yybegin(COMMENT);}
<COMMENT>"**/" {yybegin(YYINITIAL);}
<COMMENT>. {}

<YYINITIAL>"+" {System.err.println(yytext()); return new Symbol(A4Symbol.PLUS);}
<YYINITIAL>"-" {System.err.println(yytext()); return new Symbol(A4Symbol.MINUS);}
<YYINITIAL>"*" {System.err.println(yytext()); return new Symbol(A4Symbol.TIMES);}
<YYINITIAL>"/" {System.err.println(yytext()); return new Symbol(A4Symbol.DIVIDE);}
<YYINITIAL>"(" {System.err.println(yytext()); return new Symbol(A4Symbol.LPAREN);}
<YYINITIAL>")" {System.err.println(yytext()); return new Symbol(A4Symbol.RPAREN);}
<YYINITIAL>";" {System.err.println(yytext()); return new Symbol(A4Symbol.SEMI);}
<YYINITIAL>"==" {System.err.println(yytext()); return new Symbol(A4Symbol.ISEQUAL);}
<YYINITIAL>"!=" {System.err.println(yytext()); return new Symbol(A4Symbol.ISNOTEQUAL);}
<YYINITIAL>":=" {System.err.println(yytext()); return new Symbol(A4Symbol.EQUAL);}
<YYINITIAL>"," {System.err.println(yytext()); return new Symbol(A4Symbol.COMMA);}

<YYINITIAL>{REALNUMBER} {System.err.println(yytext()); return new Symbol(A4Symbol.REALNUMBER, new String(yytext()));}
<YYINITIAL>{INTNUMBER} {System.err.println(yytext()); return new Symbol(A4Symbol.INTNUMBER, new String(yytext()));}

<YYINITIAL>INT {System.err.println(yytext()); return new Symbol(A4Symbol.INT);}
<YYINITIAL>REAL {System.err.println(yytext()); return new Symbol(A4Symbol.REAL);}
<YYINITIAL>STRING {System.err.println(yytext()); return new Symbol(A4Symbol.STRING);}

<YYINITIAL>WRITE {System.err.println(yytext()); return new Symbol(A4Symbol.WRITE);}
<YYINITIAL>READ {System.err.println(yytext()); return new Symbol(A4Symbol.READ);}

<YYINITIAL>MAIN {System.err.println(yytext()); return new Symbol(A4Symbol.MAIN);}
<YYINITIAL>RETURN {System.err.println(yytext()); return new Symbol(A4Symbol.RETURN);}

<YYINITIAL>BEGIN {System.err.println(yytext()); return new Symbol(A4Symbol.BEGIN);}
<YYINITIAL>END {System.err.println(yytext()); return new Symbol(A4Symbol.END);}

<YYINITIAL>IF {System.err.println(yytext()); return new Symbol(A4Symbol.IF);}
<YYINITIAL>ELSE {System.err.println(yytext()); return new Symbol(A4Symbol.ELSE);}


<YYINITIAL>{IDENTIFIER} {System.err.println(yytext()); return new Symbol(A4Symbol.IDENTIFIER, new String(yytext()));}

\r|\n|\t|" "  {}    
. {return new Symbol(A4Symbol.ERROR);}
