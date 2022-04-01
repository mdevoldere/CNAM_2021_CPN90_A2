use usal3k_streaming;

SELECT * FROM films;
select * from propose;

SET autocommit = 0;


START TRANSACTION;


INSERT INTO films (film_id, film_title) 
VALUES 
(12, 'LOTR');

INSERT INTO films (film_id, film_title) 
VALUES 
(13, 'Seven');

/* ASSOCIER LES 2 FILMS PRECEDENTS AU SERVICE N°1 */

INSERT INTO propose 
(service_id, film_id)
VALUES
(1, 12);


COMMIT;
-- ROLLBACK;
