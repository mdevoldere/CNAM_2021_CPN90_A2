CREATE TABLE compagnies(
   compagnie_id INT AUTO_INCREMENT,
   compagnie_name VARCHAR(50) NOT NULL,
   PRIMARY KEY(compagnie_id)
);

CREATE TABLE foyers(
   particulier_id INT,
   PRIMARY KEY(particulier_id)
);

CREATE TABLE entreprises(
   ets_id INT,
   PRIMARY KEY(ets_id)
);

CREATE TABLE clients(
   client_id INT AUTO_INCREMENT,
   client_name VARCHAR(50) NOT NULL,
   ets_id INT NULL,
   particulier_id INT NULL,
   compagnie_id INT NOT NULL,
   PRIMARY KEY(client_id),
   FOREIGN KEY(ets_id) REFERENCES entreprises(ets_id),
   FOREIGN KEY(particulier_id) REFERENCES Foyers(particulier_id),
   FOREIGN KEY(compagnie_id) REFERENCES compagnies(compagnie_id)
);
