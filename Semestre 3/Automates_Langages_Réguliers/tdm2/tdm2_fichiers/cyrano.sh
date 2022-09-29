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

#la réponse à la q1 vous est fournie ;-)
name="contenant la sous-chaîne «nez»"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options 'nez' Cyrano.txt 

#pour la  suite, chaque commande est à compléter
name="contenant 3 points successifs"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '\.\.\.' Cyrano.txt

name="contenant 3 voyelles non accentuées successives"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '[aeiou]{3}' Cyrano.txt

name="commençant par un A"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '^A' Cyrano.txt

name="se terminant par un ?"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '[?]$' Cyrano.txt

name="contenant un l non suivi d'un e "
echo "** Q$((quest++)) - $name"
$egrep_cmd $options 'l[^e]' Cyrano.txt

name="contenant exactement 2 occurrences de \""
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '".*"' Cyrano.txt

name="contenant le mot usuel «nez»"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '\<nez\>' Cyrano.txt

name="contenant un mot usuel se terminant par 3 voyelles non accentuées successives"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '[aeiuo]{3}\>' Cyrano.txt

name="contenant un mot usuel composé de 7 lettres alphabétiques exactement"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '\<[[:alpha:]]{7}\>' Cyrano.txt

name="contenant un mot usuel composé de 9 à 12 lettres alphabétiques"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '\<[[:alpha:]]{9,12}\>' Cyrano.txt

name="contenant un mot usuel commençant par l ou L et se terminant par e"
echo "** Q$((quest++)) - $name"
$egrep_cmd $options '\<[lL][[:alpha:]]*e\>' Cyrano.txt


