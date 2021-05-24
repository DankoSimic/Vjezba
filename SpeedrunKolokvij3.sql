DROP database IF EXISTS speedrun3;
CREATE database speedrun3;
use speedrun3;

# Part 0

create table ostavljena (
	sifra int primary key auto_increment not null,
	kuna decimal (17,5),
	lipa decimal (15,6),
	majica varchar (36),
	modelnaocala varchar (31) not null,
	prijatelj int
);

create table prijatelj (
	sifra int primary key auto_increment not null,
	kuna decimal (16,10),
	haljina varchar (37),
	lipa decimal (13,10),
	dukserica varchar (31),
	indiferentno bit not null
);

create table prijatelj_brat (
	sifra int primary key auto_increment not null,
	prijatelj int not null,
	brat int not null
);

create table brat (
	sifra int primary key auto_increment not null,
	jmbag char (11),
	ogrlica int not null,
	ekstroventno bit not null
);

create table snasa (
	sifra int primary key auto_increment not null,
	introventno bit,
	kuna decimal (15,6) not null,
	eura decimal (12,9) not null,
	treciputa datetime,
	ostavljena int
);

create table punica (
	sifra int primary key auto_increment not null,
	asocijalno bit,
	kratkamajica varchar(44),
	kuna decimal (13,8) not null,
	vesta varchar (32) not null,
	snasa int
);

create table svekar (
	sifra int primary key auto_increment not null,
	novcica decimal (16,8) not null,
	suknja varchar (44) not null,
	bojakose varchar (36),
	prstena int,
	narukvica int not null,
	cura int not null
);

create table cura (
	sifra int primary key auto_increment not null,
	dukserica varchar (49),
	maraka decimal (13,7),
	drugiputa datetime,
	majcia varchar (49),
	novcica decimal (15,8),
	ogrlica int not null
);

alter table prijatelj_brat add foreign key (brat) references brat (sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj (sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj (sifra);
alter table snasa add foreign key (ostavljena) references ostavljena (sifra);
alter table punica add foreign key (snasa) references snasa (sifra);
alter table svekar add foreign key (cura) references cura (sifra);

# Part 1

insert into brat (ogrlica,ekstroventno) values
(1,1),
(2,0),
(3,1)
;

select * from brat;

insert into prijatelj (indiferentno) values
(1),
(0),
(1)
;

select * from prijatelj;

insert into prijatelj_brat (prijatelj,brat) values
(1,1),
(2,2),
(3,3)
;

select * from prijatelj_brat;

insert into ostavljena (modelnaocala) values
('avijatičarke'),
('skijaške'),
('puknute')
;

select * from ostavljena;

insert into snasa (kuna,eura,ostavljena) values
(10,70,1),
(20,140,2),
(30,210,3)
;

select * from snasa;

# Part 2

delete from punica where kratkamajica='AB';

# Part 3

select majica from ostavljena where 
not lipa=9 
and not lipa=10 
and not lipa =20
and not lipa =35
;

# Part 4

select e.kuna, a.ekstroventno, f.vesta
from brat a inner join prijatelj_brat b on a.sifra=b.brat
inner join prijatelj c on b.brat=c.sifra 
inner join ostavljena d on c.sifra=d.prijatelj 
inner join snasa e on d.sifra=e.ostavljena
inner join punica f on e.sifra=f.snasa
where d.lipa <>91 and c.haljina like '%ba%'
;

# Part 5

select c.haljina, c.lipa 
from brat a inner join prijatelj_brat b on a.sifra=b.brat
inner join prijatelj c on b.brat=c.sifra 
where b.sifra is null
;

# Time 42:30