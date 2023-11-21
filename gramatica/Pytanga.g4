grammar Pytanga;

// Definição de tokens
INTEIRO: 'inteiro';
FLUTUANTE: 'flutuante';
CAR: 'car';
LISTA_UNIFORME: 'lista';
LISTA_DIVERSA: 'matriz';

ABRE_CHAVE: '{';
FECHA_CHAVE: '}';
ABRE_COLCHETE: '[';
FECHA_COLCHETE: ']';
ABRE_PARENTESE: '(';
FECHA_PARENTESE: ')';
PONTO_E_VIRGULA: ';';
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

NUMERO_INTEIRO: [0-9]+;
NUMERO_REAL: [0-9]+ PONTO [0-9]+;
WS: ('\n' | '\t' | '\r' | ' ')+ -> skip;
COMENTARIO: '//' ~[\r\n]* | '/*' .*? '*/';
IDENTIFICADOR: [a-zA-Z_] [a-zA-Z_0-9]*;

// Adicionando uma regra de inicialização
programa: comando* EOF;

// Regras de comando
comando: declaracao_variavel
       | atribuicao PONTO_E_VIRGULA
       | condicional
       | loop
       | comentario;

matriz: ABRE_COLCHETE (lista (VIRGULA lista)*)? FECHA_COLCHETE;

declaracao_variavel: (INTEIRO | FLUTUANTE | CAR | LISTA_UNIFORME | LISTA_DIVERSA)
                   IDENTIFICADOR IGUAL (expressao | lista | matriz) PONTO_E_VIRGULA;

lista: ABRE_COLCHETE (expressao (VIRGULA expressao)*)? FECHA_COLCHETE;

atribuicao: IDENTIFICADOR (SOMA_IGUAL | SUBTRACAO_IGUAL | MULTIPLICACAO_IGUAL | DIVISAO_IGUAL)? IGUAL expressao PONTO_E_VIRGULA;

condicional: 'se' expressao_condicional 'entao' bloco ('senao' bloco)?;

loop: 'enquanto' expressao_condicional 'facca' bloco;

declaracao_sem_ponto_e_virgula: (declaracao_variavel | atribuicao) PONTO_E_VIRGULA?;

bloco: ABRE_CHAVE declaracao_sem_ponto_e_virgula* FECHA_CHAVE;

expressao_condicional: (IDENTIFICADOR | NUMERO_INTEIRO | NUMERO_REAL)
                    (MENOR_QUE | MAIOR_QUE | MENOR_IGUAL | MAIOR_IGUAL | IGUAL_IGUAL | DIFERENTE | NAO_LOGICO)
                    (IDENTIFICADOR | NUMERO_INTEIRO | NUMERO_REAL | IDENTIFICADOR IGUAL expressao | IDENTIFICADOR SOMA_IGUAL expressao);

expressao: additiveExpression
         | NUMERO_INTEIRO
         | NUMERO_REAL
         | STRING_LITERAL
         | IDENTIFICADOR
         | PAR_OPEN expressao PAR_CLOSE;

additiveExpression: multiplicativeExpression (SOMA | SUBTRACAO right=multiplicativeExpression)*;

multiplicativeExpression: unaryExpression (MULTIPLICACAO right=unaryExpression | DIVISAO right=unaryExpression)*;

unaryExpression: primaryExpression | (SOMA | SUBTRACAO | NAO_LOGICO) unaryExpression;

primaryExpression: IDENTIFICADOR
                | NUMERO_INTEIRO
                | NUMERO_REAL
                | STRING_LITERAL
                | PAR_OPEN expressao PAR_CLOSE;

STRING_LITERAL: '"' (~['"\r\n])* '"';

argumentList: (expressao (VIRGULA expressao)*)?;

parameterList: (parameter (VIRGULA parameter)*)?;

parameter: typeDeclaration IDENTIFICADOR;

typeDeclaration: 'inteiro'
              | 'flutuante'
              | 'car'
              | 'lista'
              | 'matriz'
              | 'lista<inteiro>'
              | 'lista<flutuante>'
              | 'lista<car>'
              | 'matriz<inteiro>'
              | 'matriz<flutuante>'
              | 'matriz<car>';

comentario: COMENTARIO;

