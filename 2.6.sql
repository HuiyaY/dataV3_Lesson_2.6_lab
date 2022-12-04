-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
use sakila;
select distinct(last_name)
from actor;

-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
select last_name
from actor
group by last_name
having count(last_name) >1;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT COUNT(rental_id),staff_id
FROM rental
GROUP BY (staff_id);

-- Using the film table, find out how many films were released each year.
SELECT release_year,count(title)
FROM film
GROUP BY release_year;

-- Using the film table, find out for each rating how many films were there.
SELECT count(film_id),rating
FROM film
Group by rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT ROUND(AVG(length),2),rating
FROM film
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT AVG(length),rating 
FROM film
GROUP BY rating
having AVG(length) > 120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT title, length, DENSE_RANK() OVER(ORDER BY length DESC) as 'Rank'
FROM film
WHERE length != 0 AND length IS NOT NULL;