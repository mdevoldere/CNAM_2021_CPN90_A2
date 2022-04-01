USE usal3k_streaming;

INSERT INTO films 
(film_id, film_title) 
VALUES 
(1, 'Titanic'),
(2, 'Red Notice'),
(3, 'La ligne verte'),
(4, 'Batman begins'),
(5, 'Bienvenue à Marly-Gomont');

INSERT INTO clients 
(client_id, client_name) 
VALUES 
(1, 'Joe'),
(2, 'Léa'),
(3, 'Jack');

INSERT INTO services 
(service_id, service_name) 
VALUES 
(1, 'Netflix'),
(2, 'Prime Video'),
(3, 'Disneyplus');

INSERT INTO abonner 
(client_id, service_id) 
VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 1);

INSERT INTO propose 
(service_id, film_id) 
VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(2, 4),
(3, 5);


select * from clients;
select * from services;
select * from films;
select * from abonner;
select * from propose;