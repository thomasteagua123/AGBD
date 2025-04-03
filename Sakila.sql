-- ACT 1--
SELECT f.title, return_date, address, country, city
FROM rental r

INNER JOIN staff s on r.staff_id = s.staff_id
INNER JOIN address a on s.address_id = a.address_id
INNER JOIN city ci on a.city_id = ci.city_id
INNER JOIN country co on ci.country_id
INNER JOIN inventory i on r.inventory_id = i.inventory_id
INNER JOIN film f on i.film_id = f.film_id
WHERE r.return_date is NULL

-- ACT 2--
SELECT title, category.name, language.name, film.rating, film.length
FROM film

INNER JOIN film_category on film.film_id = film_category.film_id
INNER JOIN category on film_category.category_id = category.category_id
INNER JOIN language on film.language_id = language.language_id
WHERE film.length >= 60 AND film.length <= 120

-- ACT 3--
SELECT first_name, last_name,address, city, country
FROM staff s

INNER JOIN address a on a.address_id = s.address_id
INNER JOIN city ci on a.city_id = ci.city_id
INNER JOIN country co  on ci.country_id = co.country_id
--ACT 4--
SELECT film.title, min(rental.return_date) AS min_return_date, MAX(rental.return_date) AS max_return_date
FROM rental
INNER JOIN inventory on rental.inventory_id = inventory.inventory_id
INNER JOIN film on inventory.film_id = film.film_id
GROUP BY film.title

--ACT 5--
SELECT film.title, category.name, language.name, film.rating, film.length, 
	rental.rental_date, rental.return_date,
	customer.first_name, customer.last_name, 
	address.address, city.city, country.country,
	staff.first_name, staff.last_name
FROM rental
INNER JOIN customer on rental.customer_id = customer.customer_id
INNER JOIN inventory on rental.inventory_id = inventory.inventory_id
INNER JOIN film on inventory.film_id = film.film_id
INNER JOIN film_category on film.film_id = film_category.film_id
INNER JOIN category on film_category.category_id = category.category_id
INNER JOIN language on film.language_id = language.language_id
INNER JOIN store on inventory.store_id = store.store_id
INNER JOIN staff on store.manager_staff_id = staff.staff_id
INNER JOIN address on customer.address_id = address.address_id
INNER JOIN city on address.city_id = city.city_id
INNER JOIN country on city.country_id = country.country_id
--ACT 6--
SELECT count(*), rating FROM film
GROUP BY rating
--ACT 7--
SELECT count(title) as "Cantidad de peliculas por categoria", c.name 
from film f
INNER JOIN film_category fc on fc.film_id = f.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
--ACT 8--
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS appearances
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY appearances DESC
LIMIT 10;
--ACT 9
SELECT
   a.address,
   ci.city,
   co.country,
   COUNT(i.inventory_id) AS total_inventory
FROM inventory i
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY a.address, ci.city, co.country
ORDER BY total_inventory DESC;
--ACT 10--
SELECT CONCAT(a.address, ', ', c.city, ', ', co.country) AS local_direccion, COUNT(DISTINCT i.film_id) AS cantidad_peliculas_distintas
FROM store s
JOIN inventory i ON s.store_id = i.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
GROUP BY local_direccion;
--ACT 11--

SELECT cat.name AS categoria, AVG(f.rental_rate) AS costo_promedio_alquiler
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY cat.name;

--ACT 12--

