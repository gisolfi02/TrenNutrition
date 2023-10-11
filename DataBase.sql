drop database if exists db;
create database db;
use db;

create table categoria(
	id int primary key auto_increment,
    nome varchar(30) not null
);

create table prodotto(
	id int primary key auto_increment,
    nome varchar(30) not null,
    descrizione varchar(500) not null,
    prezzo double not null,
    idCategoria int not null,
    foreign key (idCategoria) references categoria(id)
    on delete cascade
);

create table utente(
	id int primary key auto_increment,
	email varchar(100),
    username varchar(30) not null unique,
    passwordhash varchar(50) not null,
    nome varchar(30) not null,
    cognome varchar(30) not null,
    Tel varchar(12) not null,
    Via varchar(50),
    Ncivico int,
    CAP varchar(7),
    admin boolean not null
);

create table ordine(
	NumOrdine int not null auto_increment,
    Tot double not null,
    idUtente int not null,
    primary key(NumOrdine,idUtente),
    foreign key (idUtente) references Utente(id)
	on delete cascade
);

create table prodottiordine(
	NumOrdine int not null,
    idUtente int not null,
    idProdotto int not null,
    nomeProdotto varchar(30) not null,
    quantita int not null,
    prezzoAcquisto double not null,
    primary key(NumOrdine,idUtente,idProdotto),
    foreign key(NumOrdine,idUtente) references ordine(NumOrdine,idUtente) 
    on delete cascade
);

create table prodotticarrello(
	idProdotto int not null,
    idUtente int not null,
    quantita int not null,
    primary key(idProdotto,idUtente),
    foreign key(idProdotto) references prodotto(id)
	on delete cascade,
    foreign key(idUtente) references utente(id)
    on delete cascade
);

insert into categoria(nome) values
("Proteine"),
("Creatina"),
("Amminoacidi"),
("Vitamine");


