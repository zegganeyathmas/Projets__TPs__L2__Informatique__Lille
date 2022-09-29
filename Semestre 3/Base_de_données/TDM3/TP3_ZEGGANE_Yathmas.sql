--Exercice01:


--Q1
select insee as "code insee", nom, superficie
     from communes order by superficie desc

select communes.nom like '%Lille%' as nom, nom
     from communes
     

select insee as "code_insee", substring(communes."insee" from 1 for 2) as
     departement, nom
     from communes

select communes.insee as "code insee", communes.nom, recensement as
        "année de recensement", pop_totale as "population totale"
        from communes
        join population on communes.insee=population.insee
        order by nom desc, recensement asc

select communes.insee as "code insee", communes.nom,
       population."pop_totale" as "population totale"
       from population
       join communes on communes.insee=population.insee
       where recensement=2016
       order by pop_totale desc
       
select communes.insee as "code insee", nom,
       pop_mun as "population municipale", superficie,
       cast(pop_mun/superficie as int) as "densité"
       from communes
       join population on communes.insee=population.insee
       where recensement=2016
       order by densité desc


--Q2
select insee as "code insee", nom,
       pop_mun as "population municipale", superficie,
       cast(pop_mun/superficie as int) as "densité"
       from communes
       join population using(insee)
       where recensement=2016

--Q3
select nom as "nom de commune", nom_station as "nom de station", lat as
       "latitude", lon as "longitude"
       from stations
       join communes using(insee)
       order by nom

select nom as "nom de commune", nom_station as "nom de station", lat as
       "latitude", lon as "longitude"
       from communes
       left join stations on stations.insee=communes.insee
       order by nom

--Q4
--1)
select count(*) as nb_mesures
       from mesures_mensuelles

--2)
select avg(valeur) as moyenne,
       max(valeur) as maximum, min(valeur) as minimum
       from mesures_mensuelles
       where code_polluant=7
       

--3)
select count(*) as nb_mesures, avg(valeur) as moyenne,
       max(valeur) as maximum, min(valeur) as minimum
       from mesures_mensuelles
       where code_polluant=7
       group by mesures_mensuelles.code_station

--4)
select count(*) as nb_mesures, avg(valeur) as moyenne, max(valeur) as
       maximum, min(valeur) as minimum,nom_station
       from mesures_mensuelles
       join stations on
       mesures_mensuelles.code_station=stations.code_station
       where mesures_mensuelles.code_polluant=7
       group by mesures_mensuelles.code_station, stations.nom_station
