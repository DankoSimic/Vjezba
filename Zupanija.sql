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