/*
INSERT INTO clients 
(client_name, ets_id, particulier_id, compagnie_id)
VALUES 
('Mike', 11, 1, 1),
('Paul', NULL, 2, 1)
('Paul', NULL, NULL, 1);
*/

/*
Lors de l'insertion d'un client, nous devons vérifier que ce client 
est associé à un foyer (particulier_id) ou une entreprise (ets_id) mais pas les 2 ! 
*/

/*
	1. Vérifier que NEW.ets_id ou NEW.particulier_id contient une donnée
    2. Si les 2 colonnes sont renseignées : Refuser l'insertion
    3. Si aucune des 2 colonnes n'est renseignée : Refuser l'insertion
    4. Si une des 2 colonnes est renseignée :
		a. Si particulier_id renseigné : vérifier l'existance dans la table foyers
		b. Si ets_id renseigné : vérifier l'existance dans la table entreprise
*/

DROP TRIGGER IF EXISTS before_insert_clients;

DELIMITER $$

CREATE TRIGGER before_insert_clients 
BEFORE INSERT ON clients 
FOR EACH ROW 
BEGIN 
	DECLARE isOk TINYINT DEFAULT 0;

	IF (NEW.ets_id > 0 XOR NEW.particulier_id > 0)
    THEN 
		SET isOk = 1;
        
        IF NEW.ets_id = 0 
        THEN
			SET NEW.ets_id = NULL;
        END IF;
        
        IF NEW.particulier_id = 0 
        THEN
			SET NEW.particulier_id = NULL;
        END IF;
        
    END IF;
    
	IF isOk = 0
    THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Erreur d insertion';
	END IF;

END$$

DELIMITER ;


