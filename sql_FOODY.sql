use FOODY;
CREATE TABLE Client
(
Codecli char(5) primary key,
Societe varchar(40),
Contact varchar(25),
Fonction varchar(30),
Adresse char(50),
Ville varchar(20),
Region varchar(15),
Codepostal varchar(10),
Pays varchar(15),
Tel varchar(20),
Fax varchar(20)
) ;

CREATE TABLE Messager
(
NoMess int primary key,
NomMess varchar(20),
Tel varchar(14)
) ;

CREATE TABLE Employe
(
NoEmp int not null primary key,
Nom varchar(15),
Prenom varchar(15),
Fonction varchar(25),
TitreCourtoisie varchar(4),
DateNaissance datetime,
DateEmbauche datetime,
Adresse char(30),
Ville varchar(10),
Region varchar(2),
Codepostal varchar(10),
Pays varchar(3),
TelDom varchar(14),
Extension int,
RendCompteA int,
FOREIGN KEY (RendCompteA) references Employe(NoEmp)
) ;

drop table produit;
CREATE TABLE produit
(
RefProd int not null primary key,
NomProd varchar(35),
NoFour int,
CodeCateg int,
QteParUnit varchar(20),
PrixUnit float,
UnitesStock int,
UnitesCom int,
NiveauReap int,
Indisponible bool,
FOREIGN KEY (CodeCateg) references Categorie(CodeCateg),
FOREIGN KEY (NoFour) references Fournisseur(NoFour)
) ;
Alter table produit
MODIFY Indisponible bool;


drop table detailsCommande;
CREATE TABLE detailsCommande
(
NoCom int, RefProd int,
PRIMARY KEY(NoCom,RefProd),
PrixUnit float,
Qte float,
Remise float,
FOREIGN KEY (NoCom) references Commande(NoCom),
FOREIGN KEY (RefProd) references produit(RefProd)
) ;

drop table commande;
CREATE TABLE Commande
(
NoCom int not null primary key,
CodeCli varchar(5),
NoEmp int,
DateCom datetime,
ALivAvant datetime,
DateEnv datetime,
NoMess int,
Portt float,
Destinataire varchar(40),
AdrLiv varchar(50),
VilleLiv varchar(20),
RegionLiv varchar(15),
CodePostalLiv varchar(10),
PaysLiv varchar(15),
FOREIGN KEY (NoMess) references Messager(NoMess),
FOREIGN KEY (CodeCli) references Client(CodeCli),
FOREIGN KEY (NoEmp) references employe(NoEmp)
);


CREATE TABLE produit
(
RefProd int not null primary key,
NomProd varchar(35),
NoFour int,
CodeCateg int,
QteParUnit varchar(20),
PrixUnit float,
UnitesStock int,
UnitesCom int,
NiveauReap int,
Indisponible int,
FOREIGN KEY (CodeCateg) references Categorie(CodeCateg),
FOREIGN KEY (NoFour) references Fournisseur(NoFour)
) ;


CREATE TABLE Categorie
(
CodeCateg int not null primary key,
NomCateg varchar(15),
Descriptionn varchar(70)
) ;

CREATE TABLE Fournisseur
(
NoFour int not null primary key,
Societe varchar(40),
Contact varchar(30),
Fonction varchar(30),
Adresse varchar(50),
Ville varchar(15),
Region varchar(10),
CodePostal varchar(10),
Pays varchar(10),
Tel varchar(15),
Fax  varchar(15),
PageAccueil varchar(100)
) ;

INSERT INTO `foody`.`categorie` (`CodeCateg`, `NomCateg`, `Descriptionn`) VALUES ('1', 'drinks', 'Soft drinks, coffees, teas, beers, and ales');
INSERT INTO `foody`.`categorie` (`CodeCateg`, `NomCateg`, `Descriptionn`) VALUES ('2', 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings');
INSERT INTO `foody`.`categorie` (`CodeCateg`, `NomCateg`, `Descriptionn`) VALUES ('3', 'Desserts', 'Desserts, candies, and sweet breads');
INSERT INTO `foody`.`categorie` (`CodeCateg`, `NomCateg`, `Descriptionn`) VALUES ('4', 'Dairy Products', 'Cheeses');
INSERT INTO `foody`.`categorie` (`CodeCateg`, `NomCateg`, `Descriptionn`) VALUES ('5', 'Grains/Cereals', 'Breads, crackers, pasta, and cereal');
INSERT INTO `foody`.`categorie` (`CodeCateg`, `NomCateg`, `Descriptionn`) VALUES ('6', 'Meat/Poultry', 'Prepared meats');
INSERT INTO `foody`.`categorie` (`CodeCateg`, `NomCateg`, `Descriptionn`) VALUES ('7', 'Produce', 'Dried fruit and bean curd');
INSERT INTO `foody`.`categorie` (`CodeCateg`, `NomCateg`, `Descriptionn`) VA;

				