from sly import Lexer
from sly.lex import LexError

class JavaLexer(Lexer):
    ##### token types :
    tokens = {RESERVED, IDENT, OP, ASSIGN, INT, FLOAT, STRING, COMMENT, SPACES, EOL, OTHER}
    
    ##### internal variables  :
    ## --> définir chacune des variables ci-dessous. Vous pouvez en définir d'avantage.
    
    # identificateurs :
    _ident =r'[a-zA-Z][a-zA-Z0-9_\$]*'
    
    # entiers :
    _entier_base_8 =r'0(_?[0-7])*'
    _entier_base_16 =r'0[x|X]([0-9A-Fa-f])+[_]*[0-9A-Fa-f]*[_]*'
    _entier_base_2 =r'0[b|B][0|1][_]*[0|1]*[_]*'
    _entier_base_10 =r'[1-9](_?[0-9])*'
    
    
    # flottants
    _sequence_decimale=r'[0-9]+'
    _mantisse =r'{_sequence_decimale}[.]{_sequence_decimale}'
    _expo =r'[e|E][+|-]?[0-9]_*[0-9]*_*'
    
    
    # deux types de commentaires :
    _comment1 = r'^[//][^\n]*\n$'
    _comment2 = r'^[/*][^*]*[*/]$'
    
    # opérateurs pouvant faire partie d'une affectation :
    _op1 = rf'[-+*/%&|^]'
    # autres opérateurs :
    _op2 = rf'(>>>|>>|<<|<|<=|>|>=|!=|==|&&|[|][|])'
    
    # chaînes :
    _chaine = r'^"[^ "\]*"$'
    
    # liste des mots réservés
    _keywords_list = ('abstract','continue','for','new','switch','assert','default','goto','package',
                      'synchronized','boolean','do','if','private','this','break','double','implements',
                      'protected','byte','else','import','public','throws','case','enum',
                      'instanceof','return','transient','catch','extends','int','short','try','char',
                      'final','interface','static','void','class','finally','long','strictfp',
                      'volatile','const','float','native','super','while')

    
    ##### TOKEN PATTERNS :
    ## --> définir chacune des variables ci-dessous.

    COMMENT=_comment1 or _comment2
    ASSIGN =r'[-|+|*|/|%|&|||^]='
    OP =_op1 or _op2
    FLOAT =_mantisse
    INT =_entier_base_8 or _entier_base_16 or _entier_base_10 or _entier_base_2
    
    STRING = _chaine
    RESERVED = '(' + '|'.join(_keywords_list) + r')\b'
    IDENT =  _ident
    SPACES = r'[ \t\r]+'
    EOL = r'\n'
    OTHER = r'.'

 
    def EOL(self, t):
        self.lineno += 1
        return t
    

if __name__ == '__main__':
    
    analyseur = JavaLexer()
    
    prompt = 'entrez une ligne de texte à analyser.  (ligne vide pour arrêter)'
    
    print(prompt);
    source = input()
    while source !='' :
        tokenIterator = analyseur.tokenize(source)
        try :
            for tok in tokenIterator :
                print(f'token -> type: {tok.type}, valeur: {tok.value}, ligne : {tok.lineno}')
        except LexError as erreur :
            print("Erreur à l'anayse lexicale ", erreur)     
        print(prompt);
        source = input()

