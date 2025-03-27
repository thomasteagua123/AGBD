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
