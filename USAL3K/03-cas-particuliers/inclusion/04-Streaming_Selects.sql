USE usal3k_streaming;

/* AFFICHER LES FILMS DISPONIBLE POUR LE CLIENT 1 */
SELECT DISTINCT film_title, client_name 
FROM films 
NATURAL JOIN propose 
NATURAL JOIN services 
NATURAL JOIN abonner 
NATURAL JOIN clients 
WHERE client_id = 1
;

/* VERIFIER SI UN ABONNEMENT EXISTE */
SELECT COUNT(*) FROM abonner 
WHERE client_id=1 AND service_id=2;















TRUNCATE TABLE lire;

INSERT INTO lire
(client_id, film_id, service_id, date_lecture, position_lecture)
VALUES
(1, 2, 1, '2022-02-01', 0);

INSERT INTO lire
(client_id, film_id, service_id, date_lecture, position_lecture)
VALUES
(1, 5, 3, '2022-02-01', 0);

select * from lire; 
















