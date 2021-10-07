# Symfony API basique avec API-Platform


## Créer un projet Symfony

Dans un terminal, placez vous dans votre répertoire de travail et saisissez la commande :

```
composer create-project symfony/skeleton my_project_name
```

Ceci créera un projet Symfony vide dans le répertoire `my_project_name`


Toujours dans le terminal, placez vous dans le répertoire de l'application Symfony :

```
cd my_project_name
```

Toutes les commandes suivantes doivent être saisies dans ce répertoire.


## Ajouter les dépendances 
```
composer require symfony/string
composer require symfony/maker-bundle --dev
composer require api       
composer require migrations 
```

## Lancer / Arrêter le serveur PHP interne 

Le point d'entrée de l'application Symfony est le fichier public/index.php

Pour démarrer le serveur web interne de PHP directement dans public :

```
php -S localhost:3000 -t public
```

Rendez-vous sur http://localhost:3000/api/

Pour arrêter le serveur : 

> CTRL+C (Dans le terminal)

## Créer une nouvelle entité 

Une entité = représentation objet d'un élément en base de données.

```
php bin/console make:entity 
```

Répondez "Oui" à la question "is Api Resource ?" puis créez les différents champs

Une fois terminé, observez le répertoire src/Entity, votre entité a été générée.

## Configuration de la base de données 

Lancer le serveur de bases de données MySQL local et créer une base de données et un utilisateur associé.

```sql
CREATE DATABASE my_database DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

CREATE USER 'utilisateur'@'localhost' IDENTIFIED BY 'azerty';

GRANT SELECT,CREATE,UPDATE,DELETE,ALTER,INSERT ON my_database.* TO 'utilisateur'@'localhost';

FLUSH PRIVILEGES;
```

Dans le fichier .env, décommentez la chaine de connexion adaptée à votre serveur de base de données.


> DATABASE_URL="mysql://utilisateur:azerty@localhost:3306/my_database?serverVersion=5.7"


## Créer la base de données (si vous ne l'avez pas créée à l'étape précédente)

```
php bin/console doctrine:database:create
```
Ceci créera la base de données définie dans la chaine de connexion du fichier .env.

Si vous souhaitez supprimer la base de données :
> php bin/console doctrine:database:drop --force


## Migrations

Pour générer le fichier de migration: 
> php bin/console make:migration

Ceci gènère un fichier qui permettra de mettre à jour la base de données (création, mise à jour des tables)

Puis appliquer la migration 
> php bin/console doctrine:migrations:migrate

Ceci applique les modifications dans la base de données (les requêtes SQL sont exécutées)


Pour supprimer toutes les migrations :
> 
php bin/console doctrine:migrations:version --all --delete

## Vider le cache 

Lorsque vous faites des modifications importantes dans vos composants, il est parfois nécessaire de vide le cache de Symfony.

> php bin/console cache:clear

Relancer le serveur et rendez-vous sur localhost:3000/api.



## config/packages/api-platform
Ajouter un titre, une description et une version à votre API :

Dans le fichier config/packages/api-platform

Sous l'élement api_platform: 

    api_platform:
        title: 'MD REST API'
        description: 'Intro API'
        version: '1.0.0'




# Quelques liens :

https://blog.nicolashachet.com/developpement-php/larchitecture-rest-expliquee-en-5-regles/

https://api-platform.com/

## Tuto Symfony API

https://www.kaherecode.com/tutorial/developper-une-api-rest-avec-symfony-et-api-platform

https://www.kaherecode.com/tutorial/developper-une-api-rest-avec-symfony-et-api-platform-les-relations-entre-entites

