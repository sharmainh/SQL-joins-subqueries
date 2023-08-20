

-- List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, city
FROM customer 
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city 
ON city.city_id = address.city_id
WHERE city LIKE 'Texas';

-- Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer 
INNER JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY amount DESC;

-- Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer  
WHERE customer_id IN(
	SELECT customer_id 
	FROM payment
	WHERE amount > 175
);

-- List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, country
FROM city
INNER JOIN country
ON city.country_id = country.country_id
INNER JOIN address 
ON city.city_id = address.city_id
INNER JOIN customer 
ON address.address_id = customer.address_id 
WHERE country LIKE 'Nepal';

-- Which staff member had the most transactions?
SELECT COUNT(payment_date), staff_id
FROM payment
GROUP BY staff_id
ORDER BY DESC;

-- How many movies of each rating are there?
SELECT COUNT(title), rating
FROM film
GROUP BY rating 

-- Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer  
WHERE customer_id IN(
	SELECT customer_id 
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id 
	HAVING COUNT(payment_id) = 1
);

-- How many free rentals did our stores give away?
SELECT COUNT(staff_id)
FROM payment
WHERE amount <= 0