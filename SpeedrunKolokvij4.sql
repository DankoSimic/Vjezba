DROP database IF EXISTS speedrun3;
CREATE database speedrun3;
use speedrun3;

# Part 0

CREATE TABLE punac (
	sifra int PRIMARY KEY auto_increment NOT NULL,
	treciputa datetime,
	majica varchar (46),
	jmbag char (11) NOT null,
	novcica decimal (18,7) NOT NULL,
	maraka decimal (12,6) NOT NULL,
	ostavljen int NOT null
);

CREATE TABLE ostavljen (
	sifra int PRIMARY KEY auto_increment NOT NULL,
	modelanocala varchar(43),
	introventno bit,
	kuna decimal (14,10)
);

CREATE TABLE mladic (
	sifra int PRIMARY KEY auto_increment NOT NULL,
	kuna decimal (15,9),
	lipa decimal (18,5),
	nausnica int,
	stilfrizura varchar (49),
	vesta varchar (34) NOT NULL
);

create table zena_mladic (
	sifra int primary key auto_increment not null,
	zena int not null,
	mladic int not null
);

create table zena (
	sifra int primary key auto_increment not null,
	suknja varchar (39) not null,
	lipa decimal (18,7),
	prstena int not null
);

create table snasa (
	sifra int primary key auto_increment not null,
	introventno bit,
	treciputa datetime,
	haljina varchar (44) not null,
	zena int not null
);

create table becar (
	sifra int primary key auto_increment not null,
	novcica decimal (14,8),
	kratkamajica varchar (48) not null,
	bojaociju varchar (36) not null,
	snasa int not null
);

create table prijatelj (
	sifra int primary key auto_increment not null,
	eura decimal (16,9),
	prstena int not null,
	gustoca decimal (16,5),
	jmbag char (11) not null,
	suknja varchar (47) not null,
	becar int not null
);

alter table prijatelj add foreign key (becar) references becar (sifra);
alter table becar add foreign key (snasa) references snasa (sifra);
alter table snasa add foreign key (zena) references zena (sifra);
alter table zena_mladic add foreign key (zena) references zena (sifra);
alter table zena_mladic add foreign key (mladic) references mladic (sifra);
alter table punac add foreign key (ostavljen) references ostavljen (sifra);

# Part 1

insert into zena (suknja,prstena) values
('a',1),
('b',2),
('c',3)
;

insert into mladic (vesta) values
('a'),
('b'),
('c')
;

insert into zena_mladic (zena,mladic) values
(1,1),
(2,2),
(3,3)
;

insert into snasa (haljina,zena) values
('a',1),
('b',2),
('c',3)
;

insert into becar (kratkamajica,bojaociju,snasa) values
('a','b',1),
('c','d',2),
('e','f',3)
;

# Part 2

update punac set majica='Osijek';

# Part 3

delete from prijatelj where prstena>17;

# Part 4

select e.kratkamajica, a.nausnica, f.jmbag
from mladic a inner join zena_mladic b on a.sifra=b.mladic
inner join zena c on b.zena=c.sifra
inner join snasa d on d.zena=c.sifra
inner join becar e on d.sifra=e.snasa
inner join prijatelj f on f.sifra=e.sifra
where d.treciputa is not null and c.lipa not like 29
;

# Part 5

select c.lipa, c.prstena
from mladic a inner join zena_mladic b on a.sifra=b.mladic
inner join zena c on b.zena=c.sifra
where b.zena is null 
;

# Time 32:25