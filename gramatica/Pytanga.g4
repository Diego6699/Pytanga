grammar Pytanga;

INTEIRO: 'inteiro';
REAL: 'flutuante';
CADEIA_CARACTERE: 'cadeia';
LISTA_UNIFORME: 'lista';
LISTA_DIVERSA: 'matriz';

ABRE_CHAVE: '{';
FECHA_CHAVE: '}';
ABRE_COLCHETE: '[';
FECHA_COLCHETE: ']';
ABRE_PARENTESE: '(';
FECHA_PARENTESE: ')';
PONTE_E_VIRGULA: ';';
ASPAS_DUPLAS: '"';
DOIS_PONTOS: ':';
PONTO: '.';
VIRGULA: ',';

MENOR_QUE: '<';
MAIOR_QUE: '>';
MENOR_IGUAL: '<=';
MAIOR_IGUAL: '>=';
IGUAL_IGUAL: '==';
DIFERENTE: '!=';

E_LOGICO: 'and';
OU_LOGICO: 'or';
NAO_LOGICO: 'not';

SOMA: '+';
SUBTRACAO: '-';
MULTIPLICACAO: '*';
DIVISAO: '/';
MODULO: '%';

IGUAL: '=';
SOMA_IGUAL: '+=';
SUBTRACAO_IGUAL: '-=';
MULTIPLICACAO_IGUAL: '*=';
DIVISAO_IGUAL: '/=';

IDENTIFICADOR: [a-z]+ [A-Z]*;
CARACTERE_LITERAL: [a-zA-Z0-9]+;
NUMERO_INTEIRO: [0-9]+;
NUMERO_REAL: [0-9]+ PONTO [0-9]*;
WS: ('\n' | '\t' | '\r' | ' ')+ -> skip;

comeco
    : programa EOF
    ;

programa
    : declaracao+
    ;

declaracao
    : definicao_variavel
    ;

definicao_variavel
    : variavel_inteiro
    | variavel_real
    | variavel_cadeia
    ;
variavel_inteiro: INTEIRO IDENTIFICADOR IGUAL NUMERO_INTEIRO PONTE_E_VIRGULA;
variavel_real: REAL IDENTIFICADOR IGUAL NUMERO_REAL PONTE_E_VIRGULA;
variavel_cadeia: CADEIA_CARACTERE IDENTIFICADOR IGUAL ASPAS_DUPLAS CARACTERE_LITERAL ASPAS_DUPLAS PONTE_E_VIRGULA;