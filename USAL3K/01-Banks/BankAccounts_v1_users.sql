/*
--- créer l'utilisateur 'mdevoldere' 
--- et lui attribue tous les privilèges sur toutes les bases de données

DROP USER IF EXISTS 'mdevoldere'@'localhost';
CREATE USER 'mdevoldere'@'localhost' IDENTIFIED BY 'azer';
REVOKE ALL PRIVILEGES ON *.* FROM 'mdevoldere'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'mdevoldere'@'localhost';
*/

/*
--- créer l'utilisateur 'toto'
--- et lui  donne tous les droits sur la base de données usal3K_2021_banks
--- cet utilisateur n'aura pas accès aux autres bases de données

DROP USER IF EXISTS 'toto'@'localhost';
CREATE USER 'toto'@'localhost' IDENTIFIED BY 'azer';
REVOKE ALL PRIVILEGES ON *.* FROM 'toto'@'localhost';
GRANT ALL PRIVILEGES ON usal3K_2021_banks.* TO 'toto'@'localhost';
*/

/*
--- crée l'utilisateur 'toto'
--- et lui donne tous les droits uniquement 
--- sur la table 'banks' de la base de données usal3K_2021_banks
--- cet utilisateur ne pourra saccéder qu'à cette table

DROP USER IF EXISTS 'toto'@'localhost';
CREATE USER 'toto'@'localhost' IDENTIFIED BY 'azer';
REVOKE ALL PRIVILEGES ON *.* FROM 'toto'@'localhost';
GRANT ALL PRIVILEGES ON usal3K_2021_banks.banks TO 'toto'@'localhost';
*/

/*
--- crée l'utilisateur 'toto'
--- lui donne le droit d'effectuer les opérations SELECT,UPDATE,INSERT,DELETE 
--- sur toutes les tables de la base de données usal3K_2021_banks 
--- toute autre opération sera interdite

DROP USER IF EXISTS 'toto'@'localhost';
CREATE USER 'toto'@'localhost' IDENTIFIED BY 'azer';
REVOKE ALL PRIVILEGES ON *.* FROM 'toto'@'localhost';
GRANT SELECT,UPDATE,INSERT,DELETE ON usal3K_2021_banks.* TO 'toto'@'localhost';
*/

--- Afficher les droits d'un utilisateur (ici toto)
SHOW GRANTS FOR 'toto'@'localhost';

/*
--- crée l'utilisateur Symfony 
--- lui donne tous les privilèges sur la base de données usal3K_2021_banks

DROP USER IF EXISTS 'symfony'@'localhost';
CREATE USER 'symfony'@'localhost' IDENTIFIED BY 'azer';
REVOKE ALL PRIVILEGES ON *.* FROM 'symfony'@'localhost';
GRANT ALL PRIVILEGES ON usal3K_2021_banks.* TO 'symfony'@'localhost';

SHOW GRANTS FOR 'symfony'@'localhost';
*/


/* CREATION D'UN ADMNISTRATEUR */
DROP USER IF EXISTS 'admin'@'localhost';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'azer';

/* OCTROI DES DROITS DE L'ADMNINISTRATEUR (tous les privilèges) */
REVOKE ALL PRIVILEGES ON *.* FROM 'admin'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';

/* DONNE LA POSSIBILITÉ DE MODIFIER LES DROITS DES AUTRES UTILISATEURS */
REVOKE GRANT OPTION ON *.* FROM 'admin'@'localhost';
GRANT GRANT OPTION ON *.* TO 'admin'@'localhost';

SHOW GRANTS FOR 'admin'@'localhost';


--- Recharge les droits des utilisateurs
--- (à exécuter après avoir créé ou modifié un utilisateur)
FLUSH PRIVILEGES;


--- base de données système de MYSQL 
use mysql;

--- table où sont stockés les utilisateurs créés (avec leur privilèges globaux)
SELECT * FROM user;
