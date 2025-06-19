-- crea las tablas games, client, buys y platform
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "client" (
	"client_id"	INTEGER,
	"game_id"	smallint NOT NULL,
	"first_name"	varchar(45) NOT NULL,
	"last_name"	varchar(45) NOT NULL,
	FOREIGN KEY("game_id") REFERENCES "games"("game_id"),
	PRIMARY KEY("client_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "platform" (
	"platform_id"	INTEGER,
	"game_id"	smallint NOT NULL,
	"client_id"	smallint NOT NULL,
	"platform_name"	varchar(100) NOT NULL,
	PRIMARY KEY("platform_id" AUTOINCREMENT),
	FOREIGN KEY("client_id") REFERENCES "client"("client_id"),
	FOREIGN KEY("game_id") REFERENCES "games"("game_id")
);
CREATE TABLE IF NOT EXISTS "buys" (
	"buy_id"	INTEGER,
	"game_id"	smallint NOT NULL,
	"client_id"	smallint NOT NULL,
	"payment_method"	varchar(100) NOT NULL,
	PRIMARY KEY("buy_id" AUTOINCREMENT),
	FOREIGN KEY("client_id") REFERENCES "client"("client_id"),
	FOREIGN KEY("game_id") REFERENCES "games"("game_id")
);
CREATE TABLE IF NOT EXISTS "games" (
	"game_id"	INTEGER,
	"name"	varchar(50) NOT NULL,
	"category"	varchar(100) NOT NULL,
	"price"	NUMERIC(5, 2) NOT NULL,
	PRIMARY KEY("game_id" AUTOINCREMENT)
);
INSERT INTO games (name, category, price)VALUES 
('Hollow knight','	Metroidvania / Plataformas de acción',79.99),
('The Legend of Zelda: Breath of the Wild','Aventura / Mundo abierto',7.00),
('FIFA 24','Deportes / Fútbol',6.99),
('Elden Ring','RPG de acción / Mundo abierto',42.99),
('Stardew Valley','Simulación / Agricultura / RPG',21.99),
('Call of Duty: Modern Warfare II','Shooter en primera persona (FPS)',19.99),
('Among Us','Multijugador / Party Game / Deductivo',9.99),
("God of War","Acción y Aventura",79.99),
("Minecraft","Aventura", 5.00),
("Mortal Kombat","Lucha",35.97);

INSERT INTO client (game_id, first_name, last_name)VALUES 
(1,'Thomas','Avila'),
(2,'Dylan','Aragon'),
(3,'Enzo','Materazzi'),
(4,'Juan','Manuel'),
(5,'Santiago','Burzolino'),
(6,'Lian','Leyenda'),
(7,'Diego','Ajata'),
(8,'Lucia','Acuña'),
(9,'Mary','Llusco'),
(10,'Abril','Herbas');

INSERT INTO buys(game_id, client_id, payment_method) VALUES
(1, 1, 'Tarjeta'),
(2, 2, 'Paypal'),
(3, 3, 'Mercado Pago'),
(4,4,'Efectivo'),
(5,5,'Tarjeta'),
(6,6,'Paypal'),
(7,7,'Mercado Pago'),
(8,8,'Efectivo'),
(9,9,'Efectivo'),
(10,10,'Paypal');

INSERT INTO platform(game_id, client_id, platform_name) VALUES
(1, 1, 'PlayStation 4'),
(2, 2, 'PC'),
(3, 3, 'PC'),
(4,4,'PlayStation 3'),
(5,5,'Nintendo'),
(6,6,'PlayStation 5'),
(7,7,'PC'),
(8,8,'PC'),
(9,9,'PlayStation 4'),
(10,10,'Mobile');