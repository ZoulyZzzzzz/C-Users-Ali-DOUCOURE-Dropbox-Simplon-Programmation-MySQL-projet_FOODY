drop database gbibliotheque;
CREATE DATABASE gbibliotheque;
USE gbibliotheque ;

CREATE TABLE Bibliothecaire
(
id_bibliothecaire INT primary key,
nom_bibliothe varchar(50),
prenom_bibliothe varchar(50)
) ;

CREATE TABLE Rayon
(
code_rayon INT primary key,
emplacement varchar(50)
) ;

CREATE TABLE Editeur
(
id_editeur INT primary key,
maison_edition varchar(50)
) ;

CREATE TABLE Auteur
(
id_auteur INT primary key,
nom_auteur varchar(50),
prenom_auteur varchar(50)
) ;

CREATE TABLE Genre_theme
(
id_genre INT primary key,
genre_litteraire varchar(50)
) ;

CREATE TABLE Mot_cle
(
id_mot_cle INT primary key,
mot varchar(50)
) ;

CREATE TABLE Categorie_prof
(
id_categorie INT primary key,
categorie varchar(50)
) ;
drop table Livre;
CREATE TABLE Livre
(
code_catalogue INT primary key,
titre varchar(100),
id_genre int,
FOREIGN KEY (id_genre) references Genre_theme(id_genre)
) ;
drop table abonne;
CREATE TABLE Abonne
(
matricule char(12) primary key,
nom_abonne varchar(50),
prenom_abonne varchar(50),
adresse varchar(150),
telephone char(30),
date_naissance date,
date_adhesion date,
inscript boolean,
id_categorie int,
FOREIGN KEY (id_categorie) references Categorie_prof(id_categorie)
) ;


drop table Exemplaire;
CREATE TABLE Exemplaire
(
code_catalogue int, code_rayon INT,
PRIMARY KEY(code_catalogue,code_rayon),
date_acquisition date,
code_etat boolean,
id_editeur int,
id_bibliothecaire int,
FOREIGN KEY (code_catalogue) references Livre(code_catalogue),
FOREIGN KEY (code_rayon) references Rayon(code_rayon),
FOREIGN KEY (id_editeur) references Editeur(id_editeur),
FOREIGN KEY (id_bibliothecaire) references Bibliothecaire(id_bibliothecaire)
) ;

drop table Livre_mot_cle;
CREATE TABLE Livre_mot_cle
(
code_catalogue INT, id_mot_cle int, 
PRIMARY KEY(code_catalogue, id_mot_cle),
FOREIGN KEY (code_catalogue) references Livre(code_catalogue),
FOREIGN KEY (id_mot_cle) references Mot_cle(id_mot_cle)
) ;

CREATE TABLE Ecrire
(
code_catalogue INT, id_auteur  int, 
PRIMARY KEY(code_catalogue, id_auteur),
FOREIGN KEY (code_catalogue) references Livre(code_catalogue),
FOREIGN KEY (id_auteur) references Auteur(id_auteur)
) ;

CREATE TABLE Demande
(
code_catalogue INT, matricule  char(12), 
PRIMARY KEY(code_catalogue, matricule),
dateDemande date,
satisfaction boolean,
FOREIGN KEY (code_catalogue) references Livre(code_catalogue),
FOREIGN KEY (matricule) references Abonne(matricule)
) ;

CREATE TABLE Echeancier
(
code_catalogue INT, matricule  char(12), code_rayon int,
PRIMARY KEY(code_catalogue, matricule, code_rayon),
datePret date,
dateRetour date,
FOREIGN KEY (code_catalogue) references Livre(code_catalogue),
FOREIGN KEY (matricule) references Abonne(matricule),
FOREIGN KEY (code_rayon) references Rayon(code_rayon)
) ;