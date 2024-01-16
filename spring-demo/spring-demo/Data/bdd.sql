create database culture;

CREATE TABLE User (
    id_user SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    sexe VARCHAR(10),
    datedenaissance DATE
);


CREATE TABLE Categorie_culture (
    id_categorieculture SERIAL PRIMARY KEY,
    rendement_par_pied DECIMAL,
    prix_rendement DECIMAL
);


CREATE TABLE Type_culture (
    id_typeculture SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    id_categorieculture INTEGER REFERENCES Categorie_culture(id_categorieculture)
);


CREATE TABLE Parcelle (
    id_parcelle SERIAL PRIMARY KEY,
    dimension DECIMAL,
    pieds INTEGER,
    prix DECIMAL,
    user INTEGER REFERENCES User(id_user),
    id_typeculture INTEGER REFERENCES Type_culture(id_typeculture)
);


CREATE TABLE Rendement (
    id_parcelle INTEGER REFERENCES Parcelle(id_parcelle),
    rendement_reel DECIMAL,
    date DATE,
    PRIMARY KEY (id_parcelle, date)
);
