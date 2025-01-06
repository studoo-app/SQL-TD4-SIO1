-- Création de la base de données
CREATE DATABASE rh_manager;

-- Utilisation de la base de données
USE rh_manager;

-- Création de la table service
CREATE TABLE service
(
    id  INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

-- Création de la table employe
CREATE TABLE employe
(
    id      INT(11) NOT NULL AUTO_INCREMENT,
    nom     VARCHAR(50) NOT NULL UNIQUE,
    prenom  VARCHAR(50) NOT NULL UNIQUE,
    service INT(11) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (service) REFERENCES service (id) ON DELETE CASCADE
);

-- Insertion des services
INSERT INTO service (nom)
VALUES ('Informatique'),
       ('Ressources Humaines'),
       ('Marketing');

-- Insertion des employés
INSERT INTO employe (nom, prenom, service)
VALUES ('Durand', 'Alice', 1),
       ('Dupont', 'Bob', 1),
       ('Martin', 'Caroline', 2),
       ('Petit', 'David', 3),
       ('Garcia', 'Emma', 2),
       ('Lemoine', 'Frédéric', 3),
       ('Morel', 'Georges', 1),
       ('Giraud', 'Hélène', 2),
       ('Chevalier', 'Isabelle', 3),
       ('Bernard', 'Jacques', 1),
       ('Rousseau', 'Kévin', 1),
       ('Leclerc', 'Laura', 2);

-- Ajout de la colonne genre
ALTER TABLE employe
    ADD genre CHAR(1) NOT NULL CHECK (genre IN ('H', 'F'));

-- Ajout de la colonne âge
ALTER TABLE employe
    ADD age TINYINT(2) NOT NULL;

-- Mise à jour des informations des employés
UPDATE employe SET genre = 'F', age = 25 WHERE nom = 'Durand';
UPDATE employe SET genre = 'H', age = 30 WHERE nom = 'Dupont';
UPDATE employe SET genre = 'F', age = 28 WHERE nom = 'Martin';
UPDATE employe SET genre = 'H', age = 45 WHERE nom = 'Petit';
UPDATE employe SET genre = 'F', age = 35 WHERE nom = 'Garcia';
UPDATE employe SET genre = 'H', age = 40 WHERE nom = 'Lemoine';
UPDATE employe SET genre = 'H', age = 50 WHERE nom = 'Morel';
UPDATE employe SET genre = 'F', age = 32 WHERE nom = 'Giraud';
UPDATE employe SET genre = 'F', age = 27 WHERE nom = 'Chevalier';
UPDATE employe SET genre = 'H', age = 38 WHERE nom = 'Bernard';
UPDATE employe SET genre = 'H', age = 33 WHERE nom = 'Rousseau';
UPDATE employe SET genre = 'F', age = 29 WHERE nom = 'Leclerc';

-- Verifications

-- RQT 1

SELECT employe.nom, employe.prenom, service.nom AS service
FROM employe
         JOIN service ON employe.service = service.id;

-- RQT 2

SELECT nom, prenom FROM employe WHERE genre = 'F';


-- RQT 3

SELECT nom, prenom FROM employe WHERE genre = 'H' ORDER BY nom ASC;


-- RQT 4

SELECT nom, prenom, age FROM employe ORDER BY age DESC;


-- RQT 5

SELECT genre, COUNT(*) AS nombre FROM employe GROUP BY genre;


-- RQT 6

SELECT service.nom AS service, COUNT(employe.id) AS nombre_employes
FROM employe
         JOIN service ON employe.service = service.id
GROUP BY service.id;


-- RQT 7

SELECT service.nom AS service, employe.genre, COUNT(*) AS nombre
FROM employe
         JOIN service ON employe.service = service.id
GROUP BY service.id, employe.genre;


-- RQT 8

SELECT employe.nom, employe.prenom, employe.age, service.nom AS service
FROM employe
         JOIN service ON employe.service = service.id
WHERE employe.age < 35
ORDER BY service.nom ASC, employe.age DESC;


-- RQT 9

SELECT nom, prenom, age
FROM employe
WHERE age > (SELECT AVG(age) FROM employe);


-- RQT 10

SELECT employe.nom, employe.prenom, employe.age, service.nom AS service
FROM employe
         JOIN service ON employe.service = service.id
WHERE employe.genre = 'H'
  AND employe.age BETWEEN 30 AND 50
ORDER BY employe.age ASC;
