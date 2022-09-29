create table nature
(
 nom text,
 code_nature text,
 id serial primary key
)

create table departement
(
 nom text,
 code_dept text primary key
)

create table academie
(
 nom text,
 code_acad text primary key
)

create table region
(
 nom text,
 code_reg text primary key
)

create table etablissement
(
 code_etab text primary key,
 appellation text,
 adresse text
)

create table commune
(
 nom text,
 code_commune text primary key,
 latitude real,
 longitude real,
 code_dept text,
 code_reg text references region(code_reg),

 foreign key (code_dept)
   references departement(code_dept)
 
)






insert into academie(code_acad,nom) select  distinct importation.code_acad
  ,importation.academie  from importation

insert into departement(code_dept,nom) select  distinct importation.code_dept
  ,importation.departement  from importation

insert into nature(code_nature,nom) select  distinct importation.code_nature
  ,importation.nature from importation

insert into region(code_reg,nom) select  distinct importation.code_reg
  ,importation.region from importation

insert into commune(code_commune,nom,latitude,longitude,code_dept,code_reg) 
  select distinct importation.code_commune,importation.commune ,importation.latitude,
  importation.longitude,importation.code_dept,importation.code_reg from importation


insert into etablissement(code_etab,appellation,adresse) 
   select distinct importation.code_etab,importation.appellation 
   importation.adresse from importation