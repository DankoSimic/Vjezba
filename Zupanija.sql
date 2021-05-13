DROP database IF EXISTS zupanija;
CREATE database zupanija;
use zupanija;

# dodan atribut broj stanovnika
create table zupanija (
	id_zupanija int primary key auto_increment not null,
	naziv varchar (50) not null,
	zupan int,
	stanovnistvo decimal (18,0)
);

# dodan atribut stranka, datum rodjenja i da li je osuđen za kazneno djelo
create table zupan (
	id_zupan int primary key auto_increment not null,
	ime varchar (50) not null,
	prezime varchar (50) not null,
	stranka varchar (50) not null,
	datum_rodjenja datetime,
	osuđivan boolean
);

create table opcina (
	id_opcina int primary key auto_increment not null,
	zupanija int not null,
	naziv varchar (50) not null
);

create table naselje (
	id_naselje int primary key auto_increment not null,
	opcina int not null,
	naziv varchar (50) not null
);

alter table zupanija add foreign key (zupan) references zupan (id_zupan);
alter table opcina add foreign key (zupanija) references zupanija (id_zupanija);
alter table naselje add foreign key (opcina) references opcina (id_opcina);

# id_zupan 1 - 3
# update na temelju novih atributa
insert into zupan (ime,prezime,stranka,datum_rodjenja,osuđivan) values
('Ivan','Anušić','HDZ','1973-10-13',true),
('Božo','Galić','HDZ','1952-08-30',false),
('Danijel','Marušić','HDZ','1972-01-01',false)
;

# id_zupanija 1 - 3
insert into zupanija (naziv,stanovnistvo,zupan) values
('Osječko-baranjska',305032,1),
('Vukovarsko-srijemska',179521,2),
('Brodsko-posavska',158575,3)
;

# id_opcina 1 - 9
insert into opcina (naziv,zupanija) values
('Grad Osijek',1),
('Antunovac',1),
('Grad Vukovar',2),
('Cerna',2),
('Okučani',3),
('Velika Kopanica',3),
('Big Digging',3),
('Little Shovel',3),
('Schtoppeldorf',1)
;

# id_naselje 1 - 17
insert into naselje (naziv,opcina) values
('Brijest',1),
('Briješće',1),
('Bezvezarija',1),
('Nigdjezemlje',1),
('Manjak Parikinga',1),
('Alamo',1),
('Random#5',1),
('Antunovac',2),
('Ivanovac',2),
('Mitnica',3),
('Lužac',3),
('Cerna',4),
('Šiškovci',4),
('Bobare',5),
('Okučani',5),
('Mala Kopanica',6),
('Velika Kopanica',6)
;

# izmjena unosa u naselje id 3-7 odnosno zamjena bezveznih podataka s stvarnim
update naselje set naziv='Josipovac'
where id_naselje=3;

update naselje set naziv='Klisa'
where id_naselje=4;

update naselje set naziv='Nemetin'
where id_naselje=5;

update naselje set naziv='Podravlje'
where id_naselje=6;

update naselje set naziv='Sarvaš'
where id_naselje =7;

# brisanje nepostojecih opcina
delete from opcina where id_opcina>6;

select * from zupan;