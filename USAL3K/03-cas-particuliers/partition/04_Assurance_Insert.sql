use assurances;

/* interdit (ni particulier_id, ni ets_id ne sont renseignés, 1 des 2 requis) */
INSERT INTO clients 
(client_name, ets_id, particulier_id, compagnie_id)
VALUES 
('Paul', 0, 0, 1);

/* interdit (particulier_id ET ets_id sont renseignés, 1 seul autorisé) */
INSERT INTO clients 
(client_name, ets_id, particulier_id, compagnie_id)
VALUES 
('Mike', 11, 1, 1);

/* OK */
INSERT INTO clients 
(client_name, ets_id, particulier_id, compagnie_id)
VALUES 
('Jack', 0, 2, 1);
