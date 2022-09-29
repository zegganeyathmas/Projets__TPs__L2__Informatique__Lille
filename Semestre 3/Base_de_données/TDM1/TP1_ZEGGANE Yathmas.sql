--QUESTION 01:
select dossard, nom from coureurs;
select dossard, nom from coureurs order by dossard asc;
select dossard, nom, equipe from coureurs order by equipe asc, nom asc;
select dossard, nom, taille from coureurs order by taille asc;
select dossard, nom from coureurs
       where coureurs.equipe='LavePlusBlanc';
select "dossard", "nom" from coureurs
       where coureurs."equipe"='LavePlusBlanc';
select nom, taille, equipe from coureurs
       where taille<180;
select nom, taille, equipe from coureurs order by taille asc;
select couleur from equipes;




-- QUESTION 02:
 select nom || ' appartient à l''équipe ' || equipe
         from coureurs
 select nom || ' appartient à l''équipe ' || equipe "appartenance"
         from coureurs
select upper(coureurs."nom") as "nom maj", char_length(coureurs."nom") as "lg"
       from coureurs
select upper(coureurs."nom") as "nom maj", char_length(coureurs."nom") as "lg"
       from coureurs order by lg asc
select upper(coureurs."nom"), char_length(coureurs."nom") 
       from coureurs order by  char_length(coureurs."nom") asc
select dossard, initcap("nom"), upper(left(equipe,3))from coureurs




-- QUESTION 03:
 select coureurs."nom" LIKE 'a%'
    from coureurs
 select coureurs."nom" LIKE '%er%'
    from coureurs
 select coureurs."nom" LIKE '_____'
    from coureurs
 select coureurs."nom" LIKE '%a__'
    from coureurs
 select coureurs."nom" LIKE '%a__%'
    from coureurs




-- QUESTION 04:
 select coureurs.taille / 100    //car on a fait une division entière
	from coureurs
 select coureurs.taille / 100.0  // car on a pas limité le nombre des chiffres derrière la virgule.
	from coureurs
 select cast(coureurs.taille/100.0 as float)
        from coureurs
select trunc(taille/100.0, 2) from coureurs


--QUESTION 05:
 la condition est: coureurs.equipe=equipes.nom
 select dossard, coureurs.nom, equipe, couleur
      from coureurs
      join equipes on coureurs.equipe=equipes.nom
 select coureurs.nom, directeur
      from coureurs
      join equipes on coureurs.equipe=equipes.nom
 select coureurs.nom, dossard, directeur
      from coureurs
      join equipes on coureurs.equipe=equipes.nom
      where directeur = 'Ralph'
 select directeur
      from equipes
      join coureurs on coureurs.equipe=equipes.nom
      where coureurs.nom='alphonse'



--QUESTION 06:
 insert into equipes values('fcb', 'rouge', 'perez')
 insert into coureurs values(8, 'yathmas', 'fcb', 185)
 insert into coureurs values(9, 'zeggane', 'fcb', 190)



-- QUESTION 07:
 select equipes.nom
       from equipes
       where directeur is null
 select equipes.nom
       from equipes
       where directeur is not null



-- QUESTION 08:
 update coureurs set taille= taille-1
 update equipes set directeur='ronchin' where directeur is null 













