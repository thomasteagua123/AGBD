-- Nombre y Apellido de todos los empleados, en orden alfabético.
SELECT FirstName, LastName FROM employees
ORDER by FirstName ASC, LastName ASC
-- Nombre y duración de todas las canciones del álbum "Big Ones" ordenados del más largo al más corto
SELECT t.name, t.Milliseconds FROM albums a
INNER JOIN tracks t on t.AlbumId = a.AlbumId
WHERE a.Title = 'Big Ones'
ORDER by t.Milliseconds DESC
-- Nombre de todos los géneros con la cantidad de canciones de cada uno
SELECT g.name,count(*) as "Cantidad de canciones" FROM genres g
INNER JOIN tracks t on g.GenreId = t.GenreId
GROUP by g.name
-- Nombre de los discos con al menos 5 canciones
SELECT a.Title, count(t.TrackId) AS "Cantidad de canciones en album" from albums a
INNER JOIN tracks t on a.AlbumId = t.AlbumId
GROUP by a.Title
HAVING count(t.TrackId) <= 5
ORDER by count(t.TrackId) ASC
-- Nombre y precio total de los 10 discos más baratos
