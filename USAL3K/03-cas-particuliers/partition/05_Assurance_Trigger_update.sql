
/*
Vérifier que les colonnes particulier_id et/ou ets_id ont été modifiées
Si c'est le cas alors : 
	1. Vérifier que NEW.ets_id ou NEW.particulier_id contient une donnée
    2. Si les 2 colonnes sont renseignées : Refuser l'insertion
    3. Si aucune des 2 colonnes n'est renseignée : Refuser l'insertion
    4. Si une des 2 colonnes est renseignée :
		a. Si particulier_id renseigné : vérifier l'existance dans la table foyers
		b. Si ets_id renseigné : vérifier l'existance dans la table entreprise
*/
DROP TRIGGER IF EXISTS before_update_clients;

DELIMITER $$

CREATE TRIGGER before_update_clients 
BEFORE UPDATE ON clients 
FOR EACH ROW 
BEGIN 
	DECLARE isOk TINYINT DEFAULT 0;
    
   -- SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = NEW.ets_id;
    
    IF (OLD.ets_id <> new.ets_id) 
    THEN        
		IF (new.ets_id > 0) 
		THEN 
			IF OLD.particulier_id IS NULL 
			THEN 
				SET isOk = 1; 
			END IF;			
		END IF; 
		
		IF isOk = 0
		THEN
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'Erreur de mise à jour';
		END IF;
    END IF;

END$$

DELIMITER ;



UPDATE clients SET ets_id = 11 WHERE client_id = 3;
