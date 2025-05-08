-- 1
SELECT FirstName, LastName FROM employees
ORDER BY LastName ASC

-- 2
SELECT t.name, t.Milliseconds FROM albums a
INNER JOIN tracks t ON t.AlbumId = a.AlbumId 
WHERE a.Title = "Big Ones"
ORDER BY t.Milliseconds DESC

-- 3
SELECT g.name, count(*) AS "Cantidad de Canciones" FROM genres g
INNER JOIN tracks t ON g.GenreId = t.GenreId
GROUP BY g.name

-- 4
SELECT a.Title, COUNT(t.TrackId) AS "Cantidad de Canciones en Album" FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.Title
HAVING COUNT(t.TrackId) >= 5
ORDER BY COUNT(t.TrackId) ASC

-- 5
SELECT a.Title, (t.UnitPrice * count(t.TrackId)) AS "Precio Total del Album" FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.Title
ORDER BY COUNT(*) ASC
LIMIT 10;

-- 6
SELECT t.name, g.name, a.Title FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
INNER JOIN genres g ON g.GenreId = t.GenreId
WHERE t.UnitPrice = 0.99

-- 7
SELECT t.name, t.Milliseconds, a.Title AS "Album", art.name AS "Artista" FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
INNER JOIN genres g ON g.GenreId = t.GenreId
INNER JOIN artists art ON art.ArtistId = a.ArtistId
ORDER BY t.Milliseconds ASC
LIMIT 20;

-- 8
SELECT LastName, Title, ReportsTo FROM employees
ORDER BY ReportsTo ASC

-- 9
INSERT INTO tracks (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(3504, 'Cuando Comenzamos A Nacer', NULL, 1, 1, 'Charly Garcia', 165000, 1999999, 0.99),
(3505, 'Fermín', NULL, 1, 1, 'Luis Alberto Spinetta', 199000, 1999999, 0.99),
(3506, 'Rumba Del Piano', NULL, 1, 1, 'Rodolfo Paéz', 273000, 1999999, 0.99),
(3507, 'Dos Días En La Vida', NULL, 1, 1, 'Rodolfo Paéz', 213000, 1999999, 0.99);

-- 10
SELECT * FROM tracks
WHERE TrackId >= 3504 AND TrackId <= 3507

-- 11
UPDATE tracks
SET Name = 'The Winner Takes It All',
    AlbumId = NULL,
    Composer = 'Björn Ulvaeus',
    Milliseconds = 295000
WHERE TrackId = 3502;

UPDATE tracks
SET Name = 'La Grasa De Las Capitales',
    AlbumId = NULL,
    Composer = 'Charly Garcia',
    Milliseconds = 289000
WHERE TrackId = 3503;

-- 12
SELECT * FROM tracks
WHERE TrackId >= 3502 AND TrackId <= 3503

-- 13
-- PRIMERO HAY QUE BORRAR LAS REFERENCIAS, YA QUE SI BORRAMOS
-- TODO DE UNA, SE ROMPERÍA LA ESTRUCTURA
DELETE FROM playlist_track
WHERE TrackId IN (3502, 3506);

DELETE FROM tracks
WHERE TrackId IN (3502, 3506); 