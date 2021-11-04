use usal3K_2021_banks;

SHOW TABLES;

SELECT * FROM banks;
SELECT * FROM bank_accounts;

UPDATE banks SET bank_balance=bank_balance+123 WHERE bank_id=1;

INSERT INTO banks 
(bank_id, bank_name, bank_balance) 
VALUES 
('10', 'TotoBank', '50000');

DELETE FROM banks WHERE bank_id=10;

/* INSTRUCTIONS REFUSEES */
DROP DATABASE usal3K_2021_banks;
CREATE TABLE toto (id int primary key);