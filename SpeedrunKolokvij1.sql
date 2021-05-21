DROP database IF EXISTS speedrun;
CREATE database speedrun;
use speedrun;

# Part 0

create table punac (
	sifra int primary key auto_increment not null,
	ogrlica int,
	gustoca decimal (14,9),
	hlace varchar (41) not null
);

create table cura (
	sifra int primary key auto_increment not null,
	novcica decimal (16,5) not null,
	gustoca decimal (18,6) not null,
	lipa decimal (13,10), 
	ogrlica int not null,
	bojakose varchar (38),
	suknja varchar (36),
	punac int
);

create table sestra (
	sifra int primary key auto_increment not null,
	introventno bit,
	haljina varchar (31) not null,
	maraka decimal (16,6),
	hlace varchar (46) not null,
	narukvica int not null
	);

create table zena (
	sifra int primary key auto_increment not null,
	treciputa datetime not null,
	hlace varchar (46),
	kratkamajica varchar (31) not null,
	jmbag char (11) not null,
	bojaociju varchar (39) not null,
	haljina varchar (44),
	sestra int not null
);

create table muskarac (
	sifra int primary key auto_increment not null,
	bojaociju varchar (50) not null,
	hlace varchar (30),
	modelnaocala varchar (43) not null,
	maraka decimal (14,5) not null,
	zena int not null
);

create table mladic (
	sifra int primary key auto_increment not null,
	suknja varchar (50) not null,
	kuna decimal (16,8) not null,
	drugiputa datetime,
	asocijalno bit,
	ekstroventno bit not null,
	dukserica varchar (48) not null,
	muskarac int
);

create table sestra_svekar (
	sifra int primary key auto_increment not null,
	sestra int not null,
	svekar int not null	
);

create table svekar (
	sifra int primary key auto_increment not null,
	bojaociju varchar(40) not null,
	prestena int,
	dukserica varchar (41),
	lipa decimal (13,8),
	eura decimal (12,7),
	majica varchar (35)
);

alter table cura add foreign key (punac) references punac (sifra);
alter table zena add foreign key (sestra) references sestra (sifra);
alter table muskarac add foreign key (zena) references zena (sifra);
alter table mladic add foreign key (muskarac) references muskarac (sifra);
alter table sestra_svekar add foreign key (sestra) references sestra (sifra);
alter table sestra_svekar add foreign key (svekar) references svekar (sifra);

# Part 1

insert into sestra (haljina, hlace, narukvica) values
('plava','plave',1);

select * from sestra;

insert into zena (treciputa,kratkamajica,jmbag,bojaociju,sestra) values
('2019-02-05','plava',12345678901,'plava',1);
insert into zena (treciputa,kratkamajica,jmbag,bojaociju,sestra) values
('2020-07-09','crvena',23456789012,'crvena',1);
insert into zena (treciputa,kratkamajica,jmbag,bojaociju,sestra) values
('2019-05-11','crna',34567890123,'crna',1);

select * from zena;

insert into muskarac (bojaociju,hlace,modelnaocala,maraka,zena) values
('plava','crne','fale stakla',200,1);
insert into muskarac (bojaociju,hlace,modelnaocala,maraka,zena) values
('crna','crne','avijatičarke',250,2);
insert into muskarac (bojaociju,hlace,modelnaocala,maraka,zena) values
('smeđa','smeđe','skijaške',275,3);

select * from muskarac;

insert into svekar (bojaociju) values ('plava');
insert into svekar (bojaociju) values ('crvena');
insert into svekar (bojaociju) values ('crna');

select * from svekar;

insert into sestra_svekar (sestra,svekar) values (1,1);
insert into sestra_svekar (sestra,svekar) values (1,2);
insert into sestra_svekar (sestra,svekar) values (1,3);

select * from sestra_svekar;

# Part 2

update cura set gustoca=15.77;

# Part 3

delete from mladic where kuna>15.78;

# Part 4

select kratkamajica from zena where hlace like '%ana%';

# Part 5

select a.dukserica, f.asocijalno, e.hlace 
from svekar a inner join sestra_svekar b on a.sifra=b.svekar 
inner join sestra c on c.sifra=b.sestra 
inner join zena d on c.sifra=d.sestra 
inner join muskarac e on d.sifra=e.zena 
inner join mladic f on e.sifra=f.muskarac 
where d.hlace like 'A%' and c.haljina like '%ba%'
;

# Part 6

select a.haljina, a.maraka 
from sestra a inner join sestra_svekar b on a.sifra=b.sestra 
where b.sestra is null
;

# Time 52:24

# Par inserta da vidim jel ovo bilo dobro

insert into punac (hlace) values ('plave');
insert into cura (novcica,ogrlica,gustoca) values (1,25,12);
insert into cura (novcica,ogrlica,gustoca) values (2,19,11);
insert into cura (novcica,ogrlica,gustoca) values (3,29,10);

select * from punac;
select * from cura;

# ponovljena naredba iz zadatka
# sve stima

update cura set gustoca=15.77;

select * from zena;

update zena set hlace='karirana' where sifra=1;

# ponovljena naredba iz zadatka
# sve stima

select kratkamajica from zena where hlace like '%ana%';

select * from sestra;

update zena set hlace='atrofirane' where sifra=2;
update sestra set haljina='bahata' where sifra=1;

select * from svekar;

update svekar set dukserica='crna' where sifra=1;
update svekar set dukserica='siva' where sifra=2;
update svekar set dukserica='plava' where sifra=3; 

select * from muskarac;
select * from mladic;

insert into mladic (suknja,kuna,asocijalno,ekstroventno,dukserica,muskarac) values
('plava',100.15,0,1,'crna',1),
('crna',120.25,1,0,'plava',2),
('zuta',150.75,1,1,'crvena',3)
;

# ponovljena naredba iz zadatka s inner joinom
# dobio podatke van tako da ovo stima

select a.dukserica, f.asocijalno, e.hlace 
from svekar a inner join sestra_svekar b on a.sifra=b.svekar 
inner join sestra c on c.sifra=b.sestra 
inner join zena d on c.sifra=d.sestra 
inner join muskarac e on d.sifra=e.zena 
inner join mladic f on e.sifra=f.muskarac 
where d.hlace like 'A%' and c.haljina like '%ba%'
;