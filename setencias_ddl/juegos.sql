--Crear la tabla games.
CREATE TABLE games(
game_id smallint PRIMARY KEY,
name varchar(50),
category varchar(100),
price NUMERIC(5, 2)
);
INSERT INTO games(name, category, price) VALUES
("God of war", "Accion y Aventura", 79.99),
("Minecraft", "Aventura", 5.00),
("Mortal Kombat", "Lucha", 35.97);

--Crear la tabla client y relacionarlo con games.
CREATE TABLE client(
client_id smallint PRIMARY KEY,
game_id smallint,
first_name varchar(45),
last_name varchar(45),
FOREIGN KEY (game_id) REFERENCES games(game_id)
);
INSERT INTO client(game_id, first_name, last_name) VALUES
(1, "Thomas", "Avila"),
(2, "Dylan", "Aragon"),
(3, "Santiago", "Gomez");

--Crear la tabla buys y sus relaciones con games y client.
CREATE TABLE buys(
buy_id smallint PRIMARY key,
game_id smallint,
client_id smallint,
payment_method varchar(100),
FOREIGN key (game_id) REFERENCES games(game_id)
FOREIGN key (client_id) REFERENCES games(client_id)
);
INSERT INTO buys(game_id, client_id, payment_method) VALUES
(1, 1, "Mercado pago"),
(2, 2, "Efectivo"),
(3, 3, "Tarjeta debito/credito");


--Crear la tabla platform y sus relaciones con games y client.
CREATE TABLE platform(
platform_id smallint PRIMARY KEY,
game_id smallint,
client_id smallint,
name_platform varchar(100),
FOREIGN KEY (game_id) REFERENCES games(game_id),
FOREIGN KEY (client_id) REFERENCES client(client_id)
);
INSERT INTO platform(game_id, client_id, platform_name) VALUES
(1, 1, "Playstation 4"),
(2, 2, "PC"),
(3, 3, "Playstation 5");