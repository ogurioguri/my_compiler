grammar divide;

@header {
    package parser;
}

// Parser rules

program : program_member* EOF ;

program_member:declaration | functionDefinition | classDefinition;

declaration : variableDeclaration ';' ;

variableDeclaration
    : type variableDeclarator (',' variableDeclarator)*
    ;

variableDeclarator
    : Identifier ('=' expression)?
    ;

type
    : basicType ('[' ']')*
    ;

basicType
    : Int
    | Bool
    | String
    | Void
    | Identifier
    ;

functionDefinition
    : type Identifier '(' parameterList? ')' block
    ;

parameterList
    : parameter (',' parameter)*
    ;

parameter
    : type Identifier
    ;

classDefinition
    : 'class' Identifier '{' classMember* '}' ';'
    ;

classMember
    : functionDefinition
    | declaration
    | constructorDefinition
    ;

constructorDefinition
    : Identifier '(' ')' block
    ;

block
    : '{' statement* '}'
    ;

statement
    : block                              #block_statement
    | declaration                        #variable_declaration_statement
    | 'if' '(' expression ')' then_statement = statement ('else' else_statement = statement)?   #if_statement
    | 'while' '(' expression ')' statement     #while_statement
    | 'for' '(' first_statement = statement  second = expression? ';' third = expression? ')' body = statement   #for_statement
    | 'return' expression? ';'  #return_statement
    | 'break' ';'               #break_statement
    | 'continue' ';'            #continue_statement
    | expression ';'            #expression_statement
    | ';'                       #empty_statement
    ;

expression
    : primary  #primary_expression
    | LeftParen  expression RightParen    #parentheses_expression
    | function = expression LeftParen (expression (Comma expression)*)? RightParen  #function_call_expression
    | New (Int | String | Bool | Identifier)  ('[' expression ']')*  ('[' ']')* (arrayLiteral)? #new_array_expression
    | name  = expression ('[' expression? ']')+  #array_access_expression
    | expression op = Dot Identifier #member_access_expression
    | <assoc = right> op = Not expression #logical_not_expression
    | expression op = (Star | Div | Mod) expression  #multiplicative_expression
    | expression op = (Plus | Minus) expression  #additive_expression
    | expression op = (PlusPlus | MinusMinus)   #behind_postfix_expression
    | < assoc=right > op = (PlusPlus | MinusMinus) expression  #pre_postfix_expression
    | expression op =(RightShift | LeftShift) expression   #shift_expression
    | expression op = (BitAnd | BitOr | BitXor) expression  #bitwise_and_or_xor_expression
    | <assoc=right> op = BitNot expression   #bitwise_not_expression
    | <assoc = right> op = (Plus|Minus)expression  #pre_unary_expression
    | expression op = (Equal | NotEqual | Less | LessEqual | Greater | GreaterEqual) expression #relational_expression
    | expression op = And expression #logical_and_expression
    | expression op = Or expression #logical_or_expression
    | <assoc=right> expression op = Assign expression  #assignment_expression
    | <assoc = right> expression Question expression Colon expression #conditional_expression
//    | New (Int | String | Bool | Identifier ) ('('')')?  #new_expression
//    | New (Int | String | Bool | Identifier) ('[' expression? ']')* (arrayLiteral)? #new_array_expression
    ;

primary
    : Identifier
    | constant
    | This
    ;

//argumentList
//    : expression (',' expression)*
//    ;

FormatStringleft: 'f' Quote (~[$/"]| Transfer | Dollar Dollar)* Dollar;
FormatStringmid: Dollar (~[$/"]| Transfer | Dollar Dollar)* Dollar;
FormatStringright: Dollar (~[$/"]| Transfer | Dollar Dollar)*? Quote;
formatString: FormatStringleft expression ((FormatStringmid expression)*?) FormatStringright;


Void : 'void' ;
Int : 'int' ;
Bool : 'bool' ;
String : 'string' ;
New : 'new' ;
Class : 'class' ;
Null : 'null' ;
This : 'this' ;
True : 'true' ;
False : 'false' ;
If : 'if' ;
Else : 'else' ;
While : 'while' ;
For : 'for' ;
Break : 'break' ;
Continue : 'continue' ;
Return : 'return' ;



Plus : '+' ;
Minus : '-' ;
Star : '*' ;
Div : '/' ;
Mod : '%' ;
Equal : '==' ;
NotEqual : '!=' ;
Less : '<' ;
LessEqual : '<=' ;
Greater : '>' ;
GreaterEqual : '>=' ;


And : '&&' ;
Or : '||' ;
Not : '!' ;

RightShift : '>>' ;
LeftShift : '<<' ;
BitAnd : '&' ;
BitOr : '|' ;
BitXor : '^' ;
BitNot : '~' ;

Assign : '=' ;

PlusPlus : '++' ;
MinusMinus : '--' ;
Dot : '.' ;
LeftParen : '(' ;
RightParen : ')' ;
LeftBracket : '[' ;
RightBracket : ']' ;
LeftBrace : '{' ;
RightBrace : '}' ;
Question : '?' ;
Colon : ':' ;
Comma : ',' ;
SemiColon : ';' ;
Quote : '"' ;
Dollar:'$';

Transfer : '\\\\' | '\\n' | '\\"';
IntegerLiteral : '0' | [1-9] [0-9]* ;
StringLiteral : Quote ( Transfer | . )*? Quote ;
arrayLiteral : LeftBrace (expression (',' expression)*)? RightBrace ;
Identifier : [a-zA-Z_][a-zA-Z0-9_]* ;



constant: IntegerLiteral | True| False | StringLiteral | Null |arrayLiteral|formatString;


WS : [ \t\r\n]+ -> skip ;
LineComment : '//' ~[\r\n]* -> skip ;
BlockComment : '/*' .*? '*/' -> skip ;

