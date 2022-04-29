use annonces;
SET AUTOCOMMIT = 0;
DROP PROCEDURE IF EXISTS buy_product;

DELIMITER $$

/*
    - vérifier si le produit est toujours en vente
    - vérifier si l'utilisateur possède assez pour l'achat
    - si oui
        - débiter l'acheteur et créditer le vendeur 
*/
CREATE PROCEDURE buy_product(IN id_user INT, IN id_product INT) 
BEGIN

    DECLARE buyer INT;
    DECLARE price INT;
    DECLARE user_amount INT;

    START TRANSACTION;
    SELECT product_buyer, product_price INTO buyer, price FROM products WHERE product_id=id_product;

    IF buyer IS NOT NULL
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le produit a déjà été vendu !'; 
    END IF;

    SELECT amount INTO user_amount from users WHERE id=id_user;

    UPDATE products SET product_buyer=id_user WHERE product_id=id_product;
    UPDATE users SET amount=amount-price WHERE id=id_user;

    IF user_amount < price
    THEN
        ROLLBACK;
    ELSE
        COMMIT; 
    END IF;

END $$

DELIMITER ;

SET AUTOCOMMIT = 1;