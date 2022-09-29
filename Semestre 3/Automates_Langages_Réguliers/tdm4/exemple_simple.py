#ZEGGANE_Yathmas

from sly import Lexer
from sly.lex import LexError
import operator

class SimpleLexer(Lexer):
    # token types :
    tokens = {IDENT, OP2, ENTIER}
    # token specifications :
    
    OP2 =    rf'add|sub|mul|div'
    _entier_base_8=r'0[o|0](_?[0-7])*'
    _entier_base_10=r'[1-9](_?[0-9])*'
    _entier_base_16=r'0[x|X](_?[0-9A-Fa-f])+'
    ENTIER = rf'{_entier_base_8}|{_entier_base_10}|{_entier_base_16}'
    IDENT =  r'[A-Za-z][A-Za-z0-9]*'
    
    ignore_comment1 = r'#[^\n]*(\n|$)'
    ignore_comment2=r'{[^{]*(}|$)'
    ignore_comment3=r'(<!-)[^<]*(->|$)'
    

    def ENTIER(self,t) :
        if (t.value[1]=='O' or t.value[1]=='o'):
            t.value = int(t.value,8)
    
        elif (t.value[1]=='x' or t.value[1]=='X') :
            t.value = int(t.value,16)
        
        else:
            t.value = int(t.value,10)
        
        return t
    
    
    def OP2(self,t) :
        if (t.value=='add') :
            t.value=operator.add
        elif (t.value=='sub') :
            t.value=operator.sub
        elif (t.value=='mul'):
            t.value=operator.mul
        elif (t.value=='div'):
            t.value=operator.floordiv
        return t
        
    
    
    
    @_(r'\n+')
    def ignore_newline(self, t):
        self.lineno += len(t.value)
 

if __name__ == '__main__':
    
    analyseur = SimpleLexer()
    #source = 'alpha+321*x5'
    print('entrez un texte à analyser');
    source = input()
    tokenIterator = analyseur.tokenize(source)
    try :
        for tok in tokenIterator :
            print(f'token -> type: {tok.type}, valeur: {tok.value} ({type(tok.value)}), ligne : {tok.lineno}')
    except LexError as erreur :
        print("Erreur à l'anayse lexicale ", erreur)
        
    

