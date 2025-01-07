-- Création de la base de données
CREATE
DATABASE trading_tracker;

-- Utilisation de la base de données
USE
trading_tracker;

-- Création de la table Trader
CREATE TABLE Trader
(
    idTrader  INT(10) NOT NULL AUTO_INCREMENT,
    nomTrader VARCHAR(50) NOT NULL,
    PRIMARY KEY (idTrader)
);

-- Création de la table Action
CREATE TABLE Action
(
    idAction  INT(10) NOT NULL AUTO_INCREMENT,
    nomAction VARCHAR(50) NOT NULL,
    PRIMARY KEY (idAction)
);

-- Création de la table Transaction
CREATE TABLE Transaction
(
    idTransaction INT(10) NOT NULL AUTO_INCREMENT,
    idAction      INT(10) NOT NULL,
    idTrader      INT(10) NOT NULL,
    montantAchat DOUBLE NOT NULL,
    quantite      INT(11) NOT NULL,
    PRIMARY KEY (idTransaction),
    FOREIGN KEY (idAction) REFERENCES Action (idAction) ON DELETE CASCADE,
    FOREIGN KEY (idTrader) REFERENCES Trader (idTrader) ON DELETE CASCADE
);

-- Insertion des traders
INSERT INTO Trader (nomTrader)
VALUES ('Alice'),
       ('Bob'),
       ('Charlie');

-- Insertion des actions
INSERT INTO Action (nomAction)
VALUES ('Apple'),
       ('Tesla'),
       ('Amazon'),
       ('Google'),
       ('Microsoft'),
       ('Meta');

-- Insertion des transactions
INSERT INTO Transaction (idAction, idTrader, montantAchat, quantite)
VALUES (1, 1, 150.0, 10), -- Alice achète Apple
       (2, 1, 720.3, 5),  -- Alice achète Tesla
       (3, 2, 95.75, 20), -- Bob achète Amazon
       (4, 2, 1250.0, 1), -- Bob achète Google
       (5, 3, 300.0, 15), -- Charlie achète Microsoft
       (6, 3, 450.5, 10); -- Charlie achète Meta

-- Modifications

ALTER TABLE Trader
    MODIFY COLUMN nomTrader VARCHAR (30) NOT NULL;

ALTER TABLE Trader
    ADD telephone VARCHAR(10) NOT NULL;

ALTER TABLE Transaction
    CHANGE COLUMN montantAchat prixAction DOUBLE NOT NULL;

UPDATE Trader SET telephone = '0102030405' WHERE idTrader = 1;
UPDATE Trader SET telephone = '0123456789' WHERE idTrader = 2;
UPDATE Trader SET telephone = '0987654321' WHERE idTrader = 3;

-- Verifications

-- RQT 1

SELECT Trader.nomTrader, Action.nomAction, Transaction.prixAction, Transaction.quantite
FROM Transaction
         JOIN Trader ON Transaction.idTrader = Trader.idTrader
         JOIN Action ON Transaction.idAction = Action.idAction;

-- RQT 2

SELECT Trader.nomTrader, SUM(Transaction.prixAction * Transaction.quantite) AS totalInvesti
FROM Transaction
         JOIN Trader ON Transaction.idTrader = Trader.idTrader
GROUP BY Trader.idTrader;

-- RQT 3

SELECT Action.nomAction, Transaction.prixAction, Transaction.quantite
FROM Transaction
         JOIN Action ON Transaction.idAction = Action.idAction
WHERE Transaction.prixAction > 100;

-- RQT 4

SELECT Trader.nomTrader, Action.nomAction, Transaction.quantite
FROM Transaction
         JOIN Trader ON Transaction.idTrader = Trader.idTrader
         JOIN Action ON Transaction.idAction = Action.idAction
WHERE Transaction.quantite > 10;

-- RQT 5

SELECT Trader.nomTrader, SUM(Transaction.prixAction * Transaction.quantite) AS valeurPortefeuille
FROM Transaction
         JOIN Trader ON Transaction.idTrader = Trader.idTrader
WHERE Trader.idTrader = 1; -- Remplacez 1 par l’ID du trader souhaité
GROUP BY Trader.idTrader;

-- RQT 6

SELECT Trader.nomTrader, SUM(Transaction.quantite) AS totalActions
FROM Transaction
         JOIN Trader ON Transaction.idTrader = Trader.idTrader
GROUP BY Trader.idTrader;

-- RQT 7

SELECT Trader.nomTrader, Action.nomAction, MAX(Transaction.prixAction) AS prixMax
FROM Transaction
         JOIN Trader ON Transaction.idTrader = Trader.idTrader
         JOIN Action ON Transaction.idAction = Action.idAction
GROUP BY Trader.idTrader;

-- RQT 8

SELECT Action.nomAction, SUM(Transaction.prixAction * Transaction.quantite) AS valeurTotale
FROM Transaction
         JOIN Action ON Transaction.idAction = Action.idAction
GROUP BY Action.idAction;

-- RQT 9

SELECT Trader.nomTrader,
       Action.nomAction,
       Transaction.quantite,
       (Transaction.prixAction * Transaction.quantite) AS valeurTotale
FROM Transaction
         JOIN Trader ON Transaction.idTrader = Trader.idTrader
         JOIN Action ON Transaction.idAction = Action.idAction
WHERE Trader.idTrader = 1;
-- Remplacez 1 par l’ID du trader souhaité

-- RQT 10

SELECT Trader.nomTrader, SUM(Transaction.prixAction * Transaction.quantite) AS valeurPortefeuille
FROM Transaction
         JOIN Trader ON Transaction.idTrader = Trader.idTrader
GROUP BY Trader.idTrader
ORDER BY valeurPortefeuille DESC;

