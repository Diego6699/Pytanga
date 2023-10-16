grammar Pytanga;

OPERADOR_ARITMETRICO: '+' | '-' | '*' | '/';
NUMERO_INTEIRO: [0-9]+;
NUMERO_REAL: [0-9]+'.'[0-9]*;
WS: ('\n' | '\t' | '\r' | ' ')+ -> skip;