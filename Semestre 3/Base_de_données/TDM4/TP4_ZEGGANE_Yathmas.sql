/*Exercice01*/
select trunc(superficie/5)+1 as cat_sup, *from communes

select trunc(superficie/5)+1 as cat_sup,count(*),avg(superficie)
      from communes
      group by cat_sup

select trunc(superficie/5)+1 as cat_sup,trunc(pop_totale/1000)+1 as cat_pop, pop_totale as pop_2016,commune,nom,communes.insee,epci,superficie from communes
      join population using(insee)
      where recensement=2016

select count(*) as nb_communes,min(superficie) as sup_minimale,                     max(superficie) as sup_maximale, round(avg(superficie),2) as sup_moyenne from communes
 
  join population using(insee)
  group by trunc(pop_totale/1000)+1
  order by trunc(pop_totale/1000)+1
select count(*) as nb_communes,min(superficie) as sup_minimale,                     max(superficie) as sup_maximale, round(avg(superficie),2) as sup_moyenne from communes
 
  join population using(insee)
 
  group by trunc(pop_totale/1000)+1
  having count(*)>5
  order by count(*) desc

/*Exercice02*/

create view population_2016 as
select count(*) as nb_communes,min(superficie) as sup_minimale,                     max(superficie) as sup_maximale, round(avg(superficie),2) as sup_moyenne from communes
 
  join population using(insee)
 
  group by trunc(pop_totale/1000)+1
  having count(*)>5
  order by count(*) desc



create view view_commune as
select count(*) as nb_communes,min(superficie) as sup_minimale,                     max(superficie) as sup_maximale, round(avg(superficie),2) as sup_moyenne from communes
 
  join population using(insee)
 
  group by trunc(pop_totale/1000)+1
  having count(*)>5
  order by count(*) desc



create view view_commune_supérieur_à_5 as
select count(*) as nb_communes,min(superficie) as sup_minimale,                     max(superficie) as sup_maximale, round(avg(superficie),2) as sup_moyenne from communes
 
  join population using(insee)
 
  group by trunc(pop_totale/1000)+1
  having count(*)>5
  order by count(*) desc


/*Exercice03*/

/*En utilisant les vues déja créées*/
select population_2016.insee,population_2016.nom,population_2016.pop_2016, pop_2012, abs(pop_2016-pop_2012) as progression, round((abs(pop_2016-pop_2012)/100.),2) as pourcentage from population_2016
join comm_2012 using(insee)
