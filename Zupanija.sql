DROP database IF EXISTS zupanija;
CREATE database zupanija;
use zupanija;

create table zupanija (
	id_zupanija int primary key auto_increment not null,
	naziv varchar (50) not null,
	zupan int
);

create table zupan (
	id_zupan int primary key auto_increment not null,
	ime varchar (50) not null,
	prezime varchar (50) not null
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
insert into zupan (ime,prezime) values
('Ivan','Anušić'),
('Božo','Galić'),
('Danijel','Marušić')
;

# id_zupanija 1 - 3
insert into zupanija (naziv,zupan) values
('Osječko-baranjska',1),
('Vukovarsko-srijemska',2),
('Brodsko-posavska',3)
;

# id_opcina 1 - 6
insert into opcina (naziv,zupanija) values
('Grad Osijek',1),
('Antunovac',1),
('Grad Vukovar',2),
('Cerna',2),
('Okučani',3),
('Velika Kopanica',3)
;

# id_naselje 1 - 12
insert into naselje (naziv,opcina) values
('Brijest',1),
('Briješće',1),
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



