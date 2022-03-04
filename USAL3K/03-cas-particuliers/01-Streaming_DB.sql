DROP DATABASE IF EXISTS usal3k_streaming; 

CREATE DATABASE usal3k_streaming CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE usal3k_streaming;


CREATE TABLE clients(
   client_id INT PRIMARY KEY,
   client_name VARCHAR(50) NOT NULL
);

CREATE TABLE films(
   film_id INT PRIMARY KEY,
   film_title VARCHAR(50) NOT NULL
);

CREATE TABLE services(
   service_id INT PRIMARY KEY,
   service_name VARCHAR(50) NOT NULL
);

CREATE TABLE propose(
   film_id INT,
   service_id INT,
   PRIMARY KEY(film_id, service_id),
   FOREIGN KEY(film_id) REFERENCES films(film_id),
   FOREIGN KEY(service_id) REFERENCES services(service_id)
);

CREATE TABLE abonner(
   client_id INT,
   service_id INT,
   PRIMARY KEY(client_id, service_id),
   FOREIGN KEY(client_id) REFERENCES clients(client_id),
   FOREIGN KEY(service_id) REFERENCES services(service_id)
);

CREATE TABLE lire(
   client_id INT,
   film_id INT,
   service_id INT,
   date_lecture VARCHAR(50) NOT NULL,
   position_lecture VARCHAR(50) NOT NULL,
   PRIMARY KEY(client_id, film_id, service_id),
   FOREIGN KEY(client_id) REFERENCES clients(client_id),
   FOREIGN KEY(film_id) REFERENCES films(film_id),
   FOREIGN KEY(service_id) REFERENCES services(service_id)
);
