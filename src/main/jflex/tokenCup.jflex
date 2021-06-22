package jflex;
import java_cup.runtime.Symbol;
import java_cup.runtime.SymbolFactory;
import java.io.StringReader;
import jcup.Symbols;

%%

%public
%class Lexer
%unicode
%cupsym Symbols
%cup
%line
%column

%{
    public Lexer(String line) {
        this(new StringReader(line));
    }

    public Symbol symbol(String name, int sym){
        System.out.println(name);
        int line = yyline + 1;
        int column = yycolumn + 1;
        return new Symbol(sym, column, line);
    }

    public Symbol symbol(String name, int sym, Object value) {
        System.out.println(name);
        int line = yyline + 1;
        int column = yycolumn + 1;
        return new Symbol(sym, column, line, value);
    }

    public void lexerError(String err){
        System.out.println("Error léxico " + err + " en linea: " + yyline + " y en columna: " + yycolumn);
    }
%}
//********************EXPRESIONES REGULARES********************

//********************LITERALES********************
DEC_LITERAL = ([0]|[-]?[1-9][0-9]*)
OCTAL_LITERAL = [-]?0[0-7]+
HEX_LITERAL = [-]?0[xX][0-9a-fA-F]+
DOUBLE_LITERAL = [-]?[0-9]+.[0-9]+

CHAR_LITERAL =  '(([^'\n\\])|(\\x[0-9]+)|(\\[a-z]))'
STRING_LITERAL = \"([^\"\\]|\\[a-zA-Z\"\\])*\"

//********************NEW LINE********************
NEW_LINE = \n|\r\n

//********************BLANK_SPACE********************
BLANK_SPACE = (\s)

//********************COMMENTS********************
BLOCK_COMMENT = \/\*[\s\S]*?\*\/
LINE_COMMENT = [//].*

//********************IDENTIFIER********************
_IDENTIFIER = [A-Za-z]([A-Za-z0-9])*


Number = [0-9]+

%%

//****************************************REGLAS***************************************
//*********************************PALABRAS RESERVADAS*********************************
"auto" {
  return symbol("auto", Symbols.AUTO);
}

"break" {
  return symbol("break", Symbols.BREAK);
}

"case" {
  return symbol("case", Symbols.CASE);
}

"char" {
  return symbol("char", Symbols.CHAR);
}

"const" {
  return symbol("const", Symbols.CONST);
}

"continue" {
  return symbol("continue", Symbols.CONTINUE);
}

"default" {
  return symbol("default", Symbols.DEFAULT);
}

"do" {
  return symbol("do", Symbols.DO);
}

"double" {
  return symbol("double", Symbols.DOUBLE);
}

"else" {
  return symbol("else", Symbols.ELSE);
}

"enum" {
  return symbol("enum", Symbols.ENUM);
}

"extern" {
  return symbol("extern", Symbols.EXTERN);
}

"float" {
  return symbol("float", Symbols.FLOAT);
}

"for" {
  return symbol("for", Symbols.FOR);
}

"goto" {
  return symbol("goto", Symbols.GOTO);
}

"if" {
  return symbol("if", Symbols.IF);
}

"int" {
  return symbol("int", Symbols.INT);
}

"long" {
  return symbol("long", Symbols.LONG);
}

"register" {
  return symbol("register", Symbols.REGISTER);
}

"return" {
  return symbol("return", Symbols.RETURN);
}

"short" {
  return symbol("short", Symbols.SHORT);
}

"signed" {
  return symbol("signed", Symbols.SIGNED);
}

"sizeof" {
  return symbol("sizeof", Symbols.SIZEOF);
}

"static" {
  return symbol("static", Symbols.STATIC);
}

"struct" {
  return symbol("struct", Symbols.STRUCT);
}

"switch" {
  return symbol("switch", Symbols.SWITCH);
}

"typedef" {
  return symbol("typedef", Symbols.TYPEDEF);
}

"union" {
  return symbol("union", Symbols.UNION);
}

"unsigned" {
  return symbol("unsigned", Symbols.UNSIGNED);
}

"void" {
  return symbol("void", Symbols.VOID);
}

"volatile" {
  return symbol("volatile", Symbols.VOLATILE);
}

"while" {
  return symbol("while", Symbols.WHILE);
}

"read" {
  return symbol("read", Symbols.READ);
}

"write" {
  return symbol("write", Symbols.WRITE);
}

//*********************************COMMENTS*********************************
{BLOCK_COMMENT} { } //IGNORE BLOCK COMMENTS

{LINE_COMMENT} { } //IGNORE LINE COMMENTS

//**********************************NEW LINE**********************************
{NEW_LINE} { } //IGNORE NEW LINES

//********************************BLANK SPACE*********************************
{BLANK_SPACE} { } //IGNORE A BLANK SPACE

//*********************************LITERALES*********************************
{DEC_LITERAL} {
  return symbol("DEC_LIT", Symbols.DEC_LIT, Integer.parseInt(yytext()));
}

{OCTAL_LITERAL} {
  return symbol("OCTAL_LIT", Symbols.OCTAL_LIT, Integer.parseInt(yytext(), 8));
}

{HEX_LITERAL} {
  return symbol("HEX_LIT", Symbols.HEX_LIT, Integer.parseInt(yytext(), 16));
}

{DOUBLE_LITERAL} {
  return symbol("DOUBLE_LIT", Symbols.DOUBLE_LIT, Double.parseDouble(yytext()));
}

{STRING_LITERAL} {
  return symbol("STRING_LIT", Symbols.STRING_LIT, yytext());
}

{CHAR_LITERAL} {
  return symbol("CHAR_LIT", Symbols.CHAR_LIT, yytext());
}

//*********************************IDENTIFICADOR*********************************
{_IDENTIFIER} {
  return symbol("IDENTIFIER", Symbols.IDENTIFIER, yytext());
}

//*********************************OPERADORES*********************************
\, {
  return symbol("COMMA", Symbols.COMMA);
}

\; {
  return symbol("SEMICOLON", Symbols.SEMICOLON);
}

\+\+ {
  return symbol("INCREMENT", Symbols.INCREMENT);
}

\-\- {
  return symbol("DECREMENT", Symbols.DECREMENT);
}

\=\= {
  return symbol("EQUAL_EQUAL", Symbols.EQUAL_EQUAL);
}

\>\= {
  return symbol("GREATER_EQUAL", Symbols.GREATER_EQUAL);
}

\> {
  return symbol("GREATER", Symbols.GREATER);
}

\? {
  return symbol("TERNARY", Symbols.TERNARY);
}

\<\= {
  return symbol("LESS_EQUAL", Symbols.LESS_EQUAL);
}

\< {
  return symbol("LESS", Symbols.LESS);
}

\!\= {
  return symbol("NOT_EQUAL", Symbols.NOT_EQUAL);
}

\|\| {
  return symbol("OR", Symbols.OR);
}

\&\& {
  return symbol("AND", Symbols.AND);
}

\! {
  return symbol("NOT", Symbols.NOT);
}

\= {
  return symbol("EQUAL", Symbols.EQUAL);
}

\+ {
  return symbol("PLUS", Symbols.PLUS);
}

\- {
  return symbol("MINUS", Symbols.MINUS);
}

\* {
  return symbol("TIMES", Symbols.TIMES);
}

\/ {
  return symbol("DIV", Symbols.DIV);
}

\% {
  return symbol("MODULE", Symbols.MODULE);
}

\( {
  return symbol("RBO", Symbols.RBO);
}

\) {
  return symbol("RBC", Symbols.RBC);
}

\[ {
  return symbol("SBO", Symbols.SBO);
}

\] {
  return symbol("SBC", Symbols.SBC);
}

\{ {
  return symbol("CBO", Symbols.CBO);
}

\} {
  return symbol("CBC", Symbols.CBC);
}

\: {
  return symbol("COLON", Symbols.COLON);
}

\. {
  return symbol("DOT", Symbols.DOT);
}

\+\= {
  return symbol("PLUS_ASSIGNMENT", Symbols.PLUS_ASSIGNMENT);
}

\-\= {
  return symbol("MINUS_ASSIGNMENT", Symbols.MINUS_ASSIGNMENT);
}

\*\= {
  return symbol("TIMES_ASSIGNMENT", Symbols.TIMES_ASSIGNMENT);
}

\/\= {
  return symbol("DIV_ASSIGNMENT", Symbols.DIV_ASSIGNMENT);
}

\& {
  return symbol("BIT_AND", Symbols.BIT_AND);
}

\^ {
  return symbol("XOR", Symbols.XOR);
}

\| {
  return symbol("BIT_OR", Symbols.BIT_OR);
}

\>\> {
  return symbol("RIGHT_SHIFT", Symbols.RIGHT_SHIFT);
}

\<\< {
  return symbol("LEFT_SHIFT", Symbols.LEFT_SHIFT);
}

\~ {
  return symbol("COMPLEMENT", Symbols.COMPLEMENT);
}

\%\= {
  return symbol("MOD_ASSIGNMENT", Symbols.MOD_ASSIGNMENT);
}

\&\= {
  return symbol("AND_ASSIGNMENT", Symbols.AND_ASSIGNMENT);
}

\^\= {
  return symbol("XOR_ASSIGNMENT", Symbols.XOR_ASSIGNMENT);
}

\|\= {
  return symbol("OR_ASSIGNMENT", Symbols.OR_ASSIGNMENT);
}

\<\<\= {
  return symbol("LEFT_SHIFT_ASSIGNMENT", Symbols.LEFT_SHIFT_ASSIGNMENT);
}

\>\>\= {
  return symbol("RIGHT_SHIFT_ASSIGNMENT", Symbols.RIGHT_SHIFT_ASSIGNMENT);
}

\-\> {
  return symbol("OP", Symbols.OP);
}

//Error
. {
  int row = yyline + 1;
  int column = yycolumn + 1;
  System.out.println("Lexical error " + yytext() + " at line: " + row + " and column: " + column);
}