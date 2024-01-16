create database culture;

CREATE TABLE Utilisateur (
    id_utilisateur SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    sexe VARCHAR(10),
    datedenaissance DATE
);
INSERT INTO User (nom, sexe, datedenaissance) VALUES
('Rojo', 'M', '1990-05-15');

CREATE TABLE Categorie_culture (
    id_categorieculture SERIAL PRIMARY KEY,
    nom_categorie VARCHAR(255),
    rendement_par_pied DECIMAL,
    prix_rendement DECIMAL
);

INSERT INTO Categorie_culture (rendement_par_pied, nom_categorie, prix_rendement) VALUES
(3.5,"Tsaramaso", 25.0);

CREATE TABLE Type_culture (
    id_typeculture SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    id_categorieculture INTEGER REFERENCES Categorie_culture(id_categorieculture)
);

INSERT INTO Type_culture (nom, id_categorieculture) VALUES
('Potager', 1),

CREATE TABLE Parcelle (
    id_parcelle SERIAL PRIMARY KEY,
    dimension DECIMAL,
    pieds INTEGER,
    prix DECIMAL,
    utilisateur INTEGER REFERENCES Utilisateur(id_utilisateur),
    id_typeculture INTEGER REFERENCES Type_culture(id_typeculture)
);
INSERT INTO Parcelle (dimension, pieds, prix, user, id_typeculture) VALUES
(100.0, 500, 1500.0, 1, 1),

CREATE TABLE Rendement (
    id_rendement SERIAL PRIMARY KEY,
    id_parcelle INTEGER REFERENCES Parcelle(id_parcelle),
    rendement_reel DECIMAL,
    date DATE
);

INSERT INTO Rendement (id_parcelle, rendement_reel, date) VALUES
(1, 350.0, '2023-08-15');

