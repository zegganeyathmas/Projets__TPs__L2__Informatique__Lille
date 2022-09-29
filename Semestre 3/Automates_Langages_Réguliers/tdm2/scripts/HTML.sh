#!/bin/bash
export LC_ALL=fr_FR.UTF-8

# la variable egrep_cmd contient le nom de la commande egrep à utiliser
if [ -x "$(command -v gegrep)" ]; then
    egrep_cmd="gegrep"  # GNU grep for OSX
else
    egrep_cmd="egrep"
fi

# options à utiliser avec egrep (décommenter une seule de deux lignes)
#options="--color" # affichage des lignes trouvées, avec colorisation
options="-c" # affiche le nombre de lignes trouvées

#la variable quest contient le n° de question
quest=1

#regexp utilisées : 
nomXML="\<([[:alpha:]]|:|_)([[:alpha:]]|:|_|[[:digit:]]|\.|-)*"
refEntite="&$nomXML"
valeurAttribut="\"$nomXML\""
baliseOuvrante="<[[:alpha:]]+[\s]([[:alpha:]]*=\"[[:alpha]]*\"[\s])*>"




name="refEntite"
echo "** Q$((quest++)) - $name"
#echo $refEntite
$egrep_cmd $options  $refEntite l2.html

name="valeurs d'attribut"
echo "** Q$((quest++)) - $name"
#echo $valeurAttribut
$egrep_cmd $options $valeurAttribut l2.html

name="balises ouvrantes"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options $baliseOuvrante l2.html


