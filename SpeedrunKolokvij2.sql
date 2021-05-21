DROP database IF EXISTS speedrun2;
CREATE database speedrun2;
use speedrun2;

# Part 0

create table prijatelj (
	sifra int primary key auto_increment not null,
	modelnaocala varchar (37),
	treciputa datetime not null,
	ekstroventno bit not null,
	prviputa datetime,
	svekar int not null
);

create table svekar (
	sifra int primary key auto_increment not null,
	stilfrizura varchar (48),
	ogrlica int not null,
	asocijano bit not null
);

create table decko (
	sifra int primary key auto_increment not null,
	indiferentno bit,
	vesta varchar (34) not null,
	asocijalno bit
);

create table decko_zarucnica (
	sifra int primary key auto_increment not null,
	decko int not null,
	zarucnica int not null
);

create table zarucnica (
	sifra int primary key auto_increment not null,
	narukvica int,
	bojakose varchar (37) not null,
	novcica decimal (15,9),
	lipa decimal (15,8),
	indiferentno bit not null
);

create table cura (
	sifra int primary key auto_increment not null,
	haljina varchar (33) not null,
	drugiputa datetime not null,
	suknja varchar (38),
	narukvica int,
	introventno bit,
	majica varchar (40) not null,
	decko int
);

create table neprijatelj (
	sifra int primary key auto_increment not null,
	majica varchar (32),
	haljina varchar (43) not null,
	lipa decimal (16,8),
	modelnaocala varchar (49) not null,
	kuna decimal (12,6) not null,
	jmbag char (11),
	cura int
);

create table brat (
	sifra int primary key auto_increment not null,
	suknja varchar (47),
	ogrlica int not null,
	asocijalno bit not null,
	neprijatelj int not null
);

alter table prijatelj add foreign key (svekar) references svekar (sifra);
alter table decko_zarucnica add foreign key (decko) references decko (sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica (sifra);
alter table cura add foreign key (decko) references decko (sifra);
alter table neprijatelj add foreign key (cura) references cura (sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj (sifra);

# Part 1

insert into decko (vesta) values
('crna'),
('siva'),
('plava')
;

select * from decko;

insert into zarucnica (bojakose,indiferentno) values
('plava',1),
('smeđa',0),
('crna',1)
;

select * from zarucnica;

insert into decko_zarucnica (decko,zarucnica) values
(1,1),
(2,2),
(3,3)
;

insert into cura (haljina,drugiputa,majica) values
('crvena','2021-01-03','crvena'),
('crna','2020-02-04','crna'),
('plava','2019-03-09','plava')
;

select * from cura;

insert into neprijatelj (haljina,modelnaocala,kuna) values
('plava','avijatičarke',200),
('crna','skijaške',250),
('crvena','pepeljarke',300)
;

select * from neprijatelj;

# Part 2

update prijatelj set treciputa='2020-04-30';

# Part 3

delete from brat where ogrlica not like 14;

# Part 4

select * from cura where drugiputa is null;

# Part 5

select e.haljina, a.novcica, f.neprijatelj 
from zarucnica a inner join decko_zarucnica b on a.sifra=b.zarucnica
inner join decko c on b.decko=c.sifra 
inner join cura d on c.sifra=d.decko 
inner join neprijatelj e on d.sifra=e.cura 
inner join brat f on e.sifra=f.neprijatelj 
where d.drugiputa is not null and c.vesta='%ba%'
;

# Part 6

select * from decko_zarucnica; 

select b.vesta, b.asocijalno 
from decko_zarucnica a inner join decko b on a.decko=b.sifra
where a.decko is null
;

# Time 47:41