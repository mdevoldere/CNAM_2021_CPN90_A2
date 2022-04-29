DROP DATABASE IF EXISTS annonces;

CREATE DATABASE annonces DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE annonces;

CREATE TABLE users
(
	id INT PRIMARY KEY,
    firstname VARCHAR(32) NOT NULL,
    amount INT NOT NULL
);

CREATE TABLE products 
(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(64) NOT NULL,
    product_price INT NOT NULL,
    product_seller INT NOT NULL,
    product_buyer INT NULL,
    FOREIGN KEY (product_seller) REFERENCES users(id),
    CONSTRAINT fk_buyer FOREIGN KEY (product_buyer) REFERENCES users(id)
);

INSERT INTO users (id, firstname, amount) VALUES 
(1, 'Paul', 1000),
(2, 'Léa', 1680),
(3, 'Léo', 300);

INSERT INTO products (product_name, product_price, product_seller) VALUES 
('Assurance auto', 150, 1),
('Subaru Impreza', 90000, 2),
('Iphone X', 1300, 3);