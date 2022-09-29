from java_lexer import JavaLexer
import io
import sys

"""
 renvoie un élément span de contenu content et de classe classe
"""
def to_span(content,classe) :
    return rf'<span class="{classe}">{content}</span>'


"""
 renvoie une chaîne contenant la traduction du token tok
 - pour un token SPACES,EOL,OTHER la chaîne contient uniquement la valeur du token
 - pour un autre token, sa valeur est encapsulée dans un
    <span class="type du token en minuscule">...</span>
"""
def translate_token(tok) :
    # a compléter
    pass #à supprimer
    
    
    
"""
 iterator est un token iterator issu d'une tokenisation d'un source Java
 
 renvoie une chaîne avec un élément HTML  <pre class="javasource">
 contant le texte source java enrichi de balises <span class="...">
"""
def translate_iterator(iterator) :
    out = io.StringIO()
    out.write('<pre class="javasource">\n');
    for tok in tokenIterator :
            out.write(translate_token(tok))
    out.write('</pre>\n');
    return out.getvalue()

"""
 renvoie une chaîne contenant le source de la page HTML
"""
def produce_page(body) :
     return f"""
<html>
 <head>
    <meta charset="utf-8" />
    <title>Programme Java</title>
    <link rel="stylesheet" href="javasyntax.css" />
 </head>
 <body>
  {body}
 </body>
</html>
"""

analyseur = JavaLexer()

if len(sys.argv)>1 :
    filename = sys.argv[1]
    f = open (filename)
else :
    f = sys.stdin

source = f.read()
tokenIterator = analyseur.tokenize(source)

colorized_source = translate_iterator(tokenIterator)

outfile = open('out.html','w')
outfile.write(produce_page(colorized_source))
outfile.close()




    
    
