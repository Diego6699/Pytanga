grammar Pytanga;



start: program EOF;

program: declaracao+;

declaracao: declaracao_variavel

declaracao_variavel: declaracao_inteiro | declaracao_real


tipo_variavel : INTEIRO | REAL | LISTA_EMCADEIADA | LISTA_DE_LISTA | CADEIA_LITERAL;

INT: 'inteiro';
REAL: 'flutuante';
CADEIA_LITERAL: 'cadeia';
LISTA_EMCADEIADA: 'lista';
LISTA_DE_LISTA: 'matriz';

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
COMENTARIO: ASPAS_DUPLAS  ASPAS_DUPLAS;
NUMERO_INTEIRO: [0-9]+;
NUMERO_REAL: [0-9]+'.'[0-9]*;
WS: ('\n' | '\t' | '\r' | ' ')+ -> skip;