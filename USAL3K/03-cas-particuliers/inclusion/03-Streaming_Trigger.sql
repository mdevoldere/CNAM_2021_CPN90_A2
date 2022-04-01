USE usal3k_streaming;

DROP TRIGGER IF EXISTS before_insert_lire;

DELIMITER $$

CREATE TRIGGER before_insert_lire 
BEFORE INSERT ON lire
FOR EACH ROW  
BEGIN
	DECLARE estAbonne INT;

	SELECT COUNT(*) INTO estAbonne FROM abonner 
	WHERE client_id=NEW.client_id AND service_id=NEW.service_id;
    
    IF estAbonne < 1 
    THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Abonnement invalide';
    END IF;

END$$

DELIMITER ;

SHOW triggers;