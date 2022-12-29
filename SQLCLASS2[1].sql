select * from store;

select * from film_actor;

select * from actor;

select * from staff;

select * from film_category;

select * from address;

select * from customer;

-- like statement : matches a set of strings

-- firstname starts with M
select * from customer
where first_name like 'M%';

-- firstname ends with m
select * from customer
where first_name like '%m';

-- customers who have 'a' in their first_name
select * from customer 
where first_name like '%a%';

-- in statement : used filter using a range of values
select first_name, last_name from customer
where first_name in ('Mary', 'Maria', 'Marie');

-- and 
select * from customer
where first_name like 'M%'
and last_name like '%m';

-- not : checks if not true
select first_name, last_name from customer
where first_name not in ('Mary', 'Maria', 'Marie');

-- all cities country id not 87, 101, 97, 44
select city from city
where country_id not in (87, 101, 97, 44);

-- select firstname, lastname of an actor whose first name is not ed, grace, joe and christian
select first_name, last_name from actor
where first_name not in ('Ed', 'Grace', 'Joe', 'Christian');

-- select records of actors whose first name does not start with 'C'
select * from actor
where first_name not like 'C%';

-- Aggregators : sum, average, min, max, count
select sum(amount) as total_amount from payment;

-- Alias : usually starts with 'as' then followed by a string, used to rename a column
select avg(amount) as average_amount from payment;

select min(amount) as mininum_amount from payment;

select max(amount) as maximum_amount from payment;

select count(amount) as number_of_entries from payment;

-- guess the output of the query below
select count(distinct(customer_id))
from payment;

-- group by is used along side aggregators to find aggregates of a set of similar values or group of values
select customer_id, sum(amount) as total_amount
from payment
group by customer_id;

-- minimum invetory_id for each customer
select customer_id, min(inventory_id) 
from rental
group by customer_id;

-- order by is used to order values either in ascending or descending order
select customer_id, min(inventory_id) 
from rental
group by customer_id
order by customer_id asc;

select customer_id, sum(amount) as total_amount
from payment
group by customer_id
order by total_amount desc;

-- select all records in language table in ascending order of name
select * 
from language
order by name;

-- select maximum amount spend by each customer in descending order of amount
select customer_id, max(amount)
from payment
group by customer_id
order by max(amount) desc;

-- or
select customer_id, max(amount) as max_amount
from payment
group by customer_id
order by max_amount desc;

-- Having is used to filter with group by/aggregates
-- amount greater than 10.99
select customer_id, max(amount) as max_amount
from payment
group by customer_id
having max(amount) > 10.99
order by max_amount desc;

-- get all customers whose payment is between 10 and 20
select customer_id, sum(amount)
from payment
group by customer_id
having sum(amount) between 10 and 20;

-- get all customers whose payment is between 10 and 20
select customer_id, sum(amount) as total_amount
from payment
group by customer_id
having sum(amount) between 20 and 50;

-- functions in sql
-- date functions
-- string functions
-- numeric functions
-- advanced functions
-- length : counts number of characters
select first_name, length(first_name) from customer;

select round(amount)
from payment;

select length('oluwatoyin') as no_of_char;

select concat('oluwatoyin', 'oyedele') as my_name;

select upper('oluwatoyin') as upper_name;

select(first_name, last_name) as full_name
from customer;

-- joins : allows to fetch details from two or more tables using a foreign key
select * from country
join city
on country.country_id = city.country_id;

select * from customer
join address
on customer.address_id = address.address_id
limit 5;

select * from customer
inner join address
on customer.address_id = address.address_id
limit 5;

select * from customer
left join address
on customer.address_id = address.address_id
limit 5;

select * from customer
right join address
on customer.address_id = address.address_id
limit 5;

select * from customer
full join address
on customer.address_id = address.address_id
limit 5;

-- what is the address of customer 341
select payment_id, payment.customer_id, address, first_name
from payment
join customer
on payment.customer_id = customer.customer_id
join address
on customer.address_id = address.address_id
where payment.customer_id = 341;

-- what are the addresses of customer 341, 114, 121
select payment_id, payment.customer_id, address, first_name
from payment
join customer
on payment.customer_id = customer.customer_id
join address
on customer.address_id = address.address_id
where payment.customer_id in (341, 114, 121)
order by first_name;

-- Display address, phone, email, names of top 10 customers based on total amount spend
-- Tables to use : payment, address, customer
-- Table link/foreign keys : customer_id, address_id
select customer.first_name, customer.last_name, address.address, address.phone, customer.email,
sum(payment.amount) as total_amount
from address
join customer
on address.address_id = customer.address_id
join payment
on customer.customer_id = payment.customer_id
group by customer.first_name, customer.last_name, address.address, address.phone, customer.email
order by total_amount desc
limit 10;

--- Advanced SQL Reading : Sub-queries, Conditional Logic ie if and case, set operators


