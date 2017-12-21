import java.util.Map;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.LinkedList;
import java.lang.String;
%%
%class Lexer
%unicode
%line
%column
%standalone
//while (a:=0; a<3;a:= a+1) do s:="test"; m:=4; z:=5.3 done;

Digit = [0-9]+
DoubleDigit = [0-9]+[,|\.]+[0-9]*
LogicOperation = [<|>|(:=)|=|+|-|/|*]
Del = [(|)|;]
Lit = [A-z]+[0-9]*[A-z]*
%%
while { System.out.println("ключевое слово (" + yyline + ", " + yycolumn +  "): " + yytext()); }
do { System.out.println("ключевое слово (" + yyline + ", " + yycolumn +  "): " + yytext()); }
done { System.out.println("ключевое слово (" + yyline + ", " + yycolumn +  "): " + yytext()); }
{Digit} { System.out.println("Число (" + yyline + ", " + yycolumn +  "): " + yytext()); }
{DoubleDigit} {System.out.println("Число с плавающей точкой (" + yyline + ", " + yycolumn +  "): " + yytext()); }
{Lit} {System.out.println("Идентификатор (" + yyline + ", " + yycolumn +  "): " + yytext()); }
{LogicOperation} {System.out.println("логическая или математическая операция (" + yyline + "," + yycolumn +")" + yytext());}
{Del} { System.out.println("разделитель (" + yyline + ", " + yycolumn +  "): " + yytext()); }
\"[A-z0-9А-я]+\" { System.out.println("Строка (" + yyline + ", " + yycolumn +  "): " + yytext()); }
