/*
Evenements bases de données : INSERT, UPDATE, DELETE
Evenements bases de données : BEFORE, AFTER
*/

use usal3k_2021_banks;

DROP TRIGGER IF EXISTS bank_insert;

DELIMITER ||

CREATE TRIGGER bank_insert BEFORE INSERT ON banks
FOR EACH ROW 
BEGIN
    
    DECLARE balanceMin INT DEFAULT 20000;
    SET balanceMin = 20000;

    IF balanceMin > NEW.bank_balance 
    THEN 
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'The bank has not enough money !';
    END IF;


END ||


CREATE TRIGGER bank_insert BEFORE UPDATE ON banks
FOR EACH ROW 
BEGIN
    
    DECLARE balanceMin INT DEFAULT 20000;
    SET balanceMin = 20000;

    IF balanceMin > NEW.bank_balance 
    THEN 
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'The bank has not enough money !';
    END IF;


END ||

DELIMITER ;

