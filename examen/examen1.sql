-- Cuántas canciones tiene el álbum unplugged?
SELECT count(*) AS "Cantidad de Canciones" FROM tracks t
INNER JOIN albums a ON a.AlbumId = t.AlbumId
WHERE a.Title = 'Unplugged'
-- Mostrar los artistas que tienen 30 o más canciones ordenadas del que tiene más al que tiene menos.
SELECT ar.name, COUNT(t.TrackId) AS "Cantidad de Canciones" FROM artists ar
INNER JOIN albums a on ar.ArtistId = a.ArtistId
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY ar.Name
HAVING COUNT(t.TrackId) >= 30
ORDER BY COUNT(t.TrackId) DESC
-- Insertar 6 canciones que elijan, con sus respectivos datos.(fijense en la estructura de la tabla que datos tiene que usar)
INSERT INTO tracks(name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES("Ares Herido",347, 1,1, "Axel Fiks", 200000, 500400, 1.90),
("Ojitos lindos",347, 1,1, "Bad Bunny", 212000, 500423, 1.90),
("Wine Pon You",347, 1,1, "Doja Cat", 251000, 2130400, 2.90),
("Magnetic",347, 1,1, "", 441000, 6100023, 0.99),
("Leave The Door Open",347, 1,1, "Bruno Mars", 4155100, 5008800, 6.00),
("After Last Nigth",347, 1,1, "Bruno Mars", 4159900, 4458363, 10.50)
-- Modificar el nombre de una canción insertada, y al segundo dato ingresado modificar los milisegundos.
UPDATE tracks
SET name = "Like That!", Milliseconds = 41240023
WHERE name = "Ojitos lindos"
-- Borrar dos datos agregados y modificados con una sola sentencia de borrar.
DELETE FROM tracks
WHERE TrackId BETWEEN 3504 AND 3506
