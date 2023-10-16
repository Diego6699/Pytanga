grammar Pytanga;

start: program EOF;

OPERADOR_LOGICO: 'and' | 'or' | 'not';
OPERADOR_ARITMETRICO: '+' | '-' | '*' | '/';
NUMERO_INTEIRO: [0-9]+;
NUMERO_REAL: [0-9]+'.'[0-9]*;
WS: ('\n' | '\t' | '\r' | ' ')+ -> skip;