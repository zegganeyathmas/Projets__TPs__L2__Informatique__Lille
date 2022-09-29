/***Exercice 01***/


/*********Q1*********/
create table etapes 
(
numero integer primary key,
nom varchar(20),
check (numero>=1)
)
 
insert into etapes values (1,'etape1')
insert into etapes values (2'etape2')
insert into etapes values (3,'etape3')


/**********Q2************/
create table temps
(
dossard integer,
etape integer,
chrono interval,
id serial primary key,
foreign key (etape)
   references etapes(numero)
)


/******Q3 Une contrainte est déja ajouté pendant la creation 
    de la table temps********/
alter table temps add foreign key(dossard) 
    references coureurs(dossard)



/*******Q4 les ch. de caracteres seront converties en intervalles.*******/
alter table temps add check(chrono >= '0h' and chrono < '6h')


/********Q5***************/
insert into temps values (1,1,'1h')
insert into temps values (2,3,'02:30')
insert into temps values (5,2,'05:25:13')
insert into temps values (2,3,'04:32:15')


/***********Q6************/
create table copieetapes as select * from etapes
create table copietemps as select * from temps

/*On ne peut pas éliuminer la table etapes directement,car il existe une clé étrangère
dans la table temps pour la clé primaire (numero) de la table etapes*/
delete from temps 
insert into temps values (8,2,'00:45')
/*c'est la valeur 12 qui a été généré pour l'identifiant de ce coureur */
delete from temps
alter sequence temps_id_seq restart
delete from etapes

insert into etapes
       select * from copieetapes
insert into temps
       select * from copietemps



/*********Q7*******/
select dossard,chrono,rank() over(order by chrono) 
  from temps
where etape=1

create view classementview as 
select dossard,chrono,rank() over(order by chrono) 
  from temps
where etape=1


select dossard,chrono,rank() over(order by chrono) 
  from temps
where etape=2

create view classementview2 as 
select dossard,chrono,rank() over(order by chrono) 
  from temps
where etape=1

/***********Q8********/
select coureurs.dossard,coureurs.nom,coureurs.equipe,classementview.chrono as chrono1,
classementview.rank as rank1,classementsecond.chrono as chrono2,classementsecond.rank as rank2
from coureurs
left join classementview using(dossard)
left join classementsecond using(dossard)


/***********Q9********/
 select coureurs.dossard,coureurs.nom,coureurs.equipe,classementview.chrono as chrono1,
classementview.rank as rank1,classementsecond.chrono as chrono2,classementsecond.rank as rank2,(classementview.chrono+classementsecond.chrono) as total_chrono
from coureurs
left join classementview using(dossard)
left join classementsecond using(dossard)
