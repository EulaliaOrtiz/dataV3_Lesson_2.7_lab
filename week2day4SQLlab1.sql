use sakila;

-- Lab | SQL Join (Part I)
-- Instructions
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query. 
select 
	c.category_id, 
    c.name,
	COUNT(f.film_id)
From category as c
Join film_category as f 
on c.category_id = f.category_id
Group by c.category_id
ORDER BY COUNT(f.film_id) DESC;

-- Display the total amount raised up by each staff member in August of 2005.
SELECT 
	s.first_name, 
	ROUND(SUM(p.amount),2) as "gross revenue per staff id"
FROM 
	payment as p
JOIN
	staff as s
ON
	p.staff_id  = s.staff_id
GROUP BY
	s.first_name;

-- Which actor has appeared in the most films? 
SELECT 
	fa.actor_id,
    concat(a.first_name,a.last_name) AS 'actor name',
    Count(film_id) as "number of appearances"
FROM
	film_actor as fa
JOIN 
	actor as a
ON 
	fa.actor_id = a.actor_id    
GROUP BY
	 fa.actor_id
ORDER BY
	"number of appearances" DESC
    LIMIT 1;

-- Most active customer (the customer that has rented the most number of films). 
SELECT 
c.customer_id, 
concat(c.first_name,c.last_name) AS 'customer name',	
count(rental_id) AS "number rentals" 
FROM 
	customer as c
JOIN
	rental as r
ON
	r.customer_id  = c.customer_id
GROUP BY
	 c.customer_id
ORDER BY
	"number rentals" DESC
    LIMIT 1;

-- Display the first and last names, as well as the address, of each staff member.
SELECT
	s.first_name,
    s.last_name,
    a.address
 FROM
	staff as s
JOIN 
	address as a
ON 
	s.address_id = a.address_id;   

-- List each film and the number of actors who are listed for that film.
SELECT 
	f.film_id,
	title, 
	count(fa.actor_id) as "number of actors"
FROM
	film_actor as fa
JOIN 
	actor as a
ON 
	fa.actor_id = a.actor_id
JOIN 
	film as f
ON 
	f.film_id = fa.film_id
GROUP BY
	f.film_id
ORDER BY "number of actors" DESC;
    
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer.List the customers alphabetically by last name.
SELECT 
	c.first_name, 
    c.last_name,
	ROUND(SUM(p.amount),2) as "gross revenue per client"
FROM 
	payment as p
JOIN
	customer as c
ON
	p.customer_id  = c.customer_id
GROUP BY
	c.customer_id
ORDER BY
	"gross revenue per client" 
    DESC;

-- List number of films per category. 
SELECT c.category_id, c.name, count(film_id) as "number of films"
FROM
	film_category as fc
JOIN 
	category as c
ON 
	fc.category_id = c.category_id
GROUP BY
	 c.category_id
ORDER BY
	"number of films" DESC;