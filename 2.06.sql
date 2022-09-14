USE Sakila;
-- 1. In the table actor, which are the actors whose last names are not repeated? 
SELECT *
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;

-- 2. Which last names appear more than once? 
SELECT last_name 
FROM Sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id,count(rental_id) FROM rental
group by staff_id;

-- 4. Using the film table, find out how many films were released each year.
SELECT count(film_id) from film
group by release_year;

-- 5. Using the film table, find out for each rating how many films were there.
SELECT rating, count(film_id) from film
group by rating;

-- 6. What is the mean length of the film for each rating type. Round off to two decimal places
SELECT 
    rating, ROUND(AVG(length), 2) AS mean
FROM
    film
GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
PG-13; -- already listed as output for question 6. 

SELECT 
    rating, ROUND(AVG(length), 2)
FROM
    Sakila.film
GROUP BY rating
HAVING ROUND(AVG(length), 2) > 120;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.
SELECT 
    title,length,rank() over (order by length DESC) AS RANKING

FROM
    sakila.film 
WHERE length is not null or 0
ORDER BY length DESC;

