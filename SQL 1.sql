-- This is a comment

-- select statement
select * from actor;

-- select all on address table
select * from address;

-- select all records from customer table
select * from customer;

-- select columns c_id, fname, lname
select customer_id, first_name, last_name 
from customer;

-- title, description and rental_rate
select title, description, rental_rate 
from film;

-- distinct 
select distinct(rental_rate)
from film;

select distinct(customer_id) from rental;

-- where clause - allow users to filter your selection
select distinct(activebool) from customer;

select * from customer 
where activebool = 'true';

-- a customer whose first name is mary
select * from customer
where first_name = 'Mary';

-- customers whose creation date is 2006 - Assignment
select first_name from customer
where extract(year from create_date) = 2006;

-- operators
-- and, or, like, ilike, in, between, not

-- and
select * from customer
where first_name = 'Mary' 
and last_name = 'Smith';

-- select all records from inven where film id is 1 and store id is 2
select * from inventory
where film_id = 1 
and store_id = 2;

-- select all records from inven where film id greater 2 and store id is greater than 2
select * from inventory
where film_id > 2 
and store_id > 2;

-- select all records from inven where film id greater 2 or store id is greater than 2
select * from inventory
where film_id > 2 
or store_id > 2;

-- select all records from inven where film id greater or equal to 2 or 
--  store id is greater than or equal to 3
select film_id, store_id
from inventory 
where film_id >= 2
or store_id >= 3;

-- between operator filter using a range of values
select * from inventory
where film_id between 1 and 3;

-- 
select * from customer;

select * from customer 
where create_date between '2006-02-14' and '2006-03-14';
