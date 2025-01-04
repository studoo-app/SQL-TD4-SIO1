![separe](https://github.com/studoo-app/.github/blob/main/profile/studoo-banner-logo.png)
# TD 4 - Pratique des jointures en SQL
[![Version](https://img.shields.io/badge/Version-2025-blue)]()

## Objectifs

- Créer et maintenir une base de données SQL.
- Comprendre le concept de clé étrangère et sa relation avec les clés primaires.
- Maîtriser la syntaxe des jointures SQL.
- Écrire des requêtes SQL intégrant des jointures pour extraire des informations pertinentes.

## Démarrage des services
- `docker compose up -d` pour démarrer les services
- `docker compose down` pour arrêter les services
- Accéder à PHPMYADMIN via `http://localhost:8080`

## Mission 1 - La base de données de la future application RH-MANAGER

### Tâches à réaliser

#### 1. Création de la base de données

Créer une base de données `rh_manager` contenant les tables `employe` et `service` avec les contraintes suivantes :

> **Table employe**
> - id : entier de taille 11 non null
> - nom : chaîne de caractères de taille 50 maximum non null et unique
> - prenom : chaîne de caractères de taille 50 maximum non null et unique
> - service : entier de taille 11  non null

> **Table service**
> - id : entier de taille 11
> - nom : chaîne de caractères de taille 100 maximum non null et unique

#### 2. Insérer des données
1. Insérer 12 employés
2. Insérer 3 services

#### 3. Modifier les tables
Vous venez de recevoir de nouvelles demandes de la part de votre client.
Vous devez mettre à jour la base de données en conséquence :

1. Ajouter un attribut genre dans la table employe (chaîne de caractères de taille 1 maximum non null et uniquement (H / F) )
2. Ajouter un attribut age dans la table employe (entier de taille 2 not null )
3. Renseigner le genre et l'age pour chaque employé


#### 4. Vérifier le fonctionnement
Créer les requêtes SQL suivantes pour vérifier le bon fonctionnement de la base de données :

1. Afficher le nom et le prénom de tous les employés ainsi que le nom du service auquel ils appartiennent
2. Afficher le nom et le prénom de tous les employés de sexe féminin
3. Afficher le nom et prénom des employés de sexe masculin classé par ordre alphabétique de nom
4. Afficher le nom et prénom et l'âge des employés classé par age décroissant
5. Afficher le nombre d'employés de sexe masculin et de sexe féminin
6. Afficher le nombre d'employés par service
7. Afficher la répartition hommes/femmes par service
8. Afficher le nom, prénom et age et service des employés dont l'age est inférieur à 35 ans classé par service et par age décroissant
9. Afficher le nombre d'employés dont l'âge est supérieur à la moyenne
10. Afficher le nom, prénom, age et service des employés masculins dont l'age est compris entre 30 et 50 ans classé par age croissant

## Mission 2 - La base de données de la future application Trading-Tracker

#### 1. Création de la base de données
Créer la base de données `trading_tracker` contenant les tables `Trader`, `Action` et `Transaction` avec les contraintes suivantes :

> **Table Trader**
> - idTrader : entier de taille 10 maximum
> - nomTrader : chaîne de caractères de taille 50 maximum

> **Table Action**
> - idAction : entier de taille 10 maximum
> - nomAction : chaîne de caractères de taille 50 maximum

> **Table Transaction**
> - idTransaction : entier de taille 10 maximum
> - idAction : entier de taille 10 maximum (clé étrangère référençant idAction)
> - idTrader : entier de taille 10 maximum (clé étrangère référençant idTrader)
> - montantAchat : double
> - quantite : entier de taille 11 maximum

#### 2. Insérer des données

- Insérer 3 traders
- Insérer 6 actions
- Insérer des données dans la table 'Transaction' pour simuler des achats d'actions par les traders

#### 3. Modifier les tables

Vous venez de recevoir de nouvelles demandes de la part de votre client.
Vous devez mettre à jour la base de données en conséquence :

- L’attribut « nomTrader » de la table « Trader » est une chaîne de taille 30 au maximum
- On souhaite ajouter le numéro de téléphone du trader qui est une chaîne de taille 10 au maximum
- On souhaite renommer l’attribut « montantAchat » de la table « Acheter » en « prixAction »
- Modifier pour chaque trader, les téléphones suivants :
    - Trader n°1 -> 0102030405
    - Trader n°2 -> 0123456789

#### 4. Vérifier le fonctionnement

Créer les requêtes SQL suivantes pour vérifier le bon fonctionnement de la base de données :

1. Afficher les détails des achats effectués (trader, action, prix, quantité).
2. Calculer le total des montants investis par chaque trader.
3. Afficher les actions achetées avec un prix supérieur à 100.
4. Lister les traders ayant acheté plus de 10 actions en une seule transaction
5. Afficher la valeur totale du portefeuille d’un trader spécifique.
6. Liste des traders et le nombre total d’actions qu’ils possèdent.
7. Actions les plus chères achetées par chaque trader
8. Liste des actions et leur valeur totale sur le marché (en fonction des quantités achetées)
9. Liste des actions détenues par un trader spécifique avec leur quantité et leur valeur totale.
10. Classement des traders par la valeur totale de leur portefeuille (ordre décroissant)