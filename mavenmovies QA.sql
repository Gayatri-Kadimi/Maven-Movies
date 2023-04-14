
-- 1. which actor acted in max number of films
select a.actor_id ,a.first_name,a.last_name,count(*) Number_of_films
from actor a join film_actor f
on a.actor_id=f.actor_id
group by actor_id;

-- 2.list of actors with their films in count in descending order
select a.actor_id,a.first_name,a.last_name,count(*) Number_of_films
from actor a join film_actor fa 
on a.actor_id=fa.actor_id
group by actor_id
order by count(*) desc;

-- 3.find the count of item inventory at each store
select * from inventory
select count(inventory_id) number_of_inventory,store_id from inventory 
group by store_id;

-- 4.How many horror movies present in moviedb(mavenmovies)
select * from category;
select * from film_category;
select name,count(*) Number_of_movies
from category c join film_category fc
on c.category_id=fc.category_id
group by c.category_id
having name='horror';

-- 5.Put the film categories name which having how many movies and 
-- list it as highest number of movies(desc)
select c.category_id,c.name,count(*) Number_of_movies
from category c join film_category fc on c.category_id=fc.category_id
join film f on fc.film_id=f.film_id 
group by fc.category_id
order by count(*) desc;

-- 6.Find the customer id who rented more films in descending order.
select rental_id,customer_id,count(customer_id) from rental group by customer_id;

select r.rental_id,c.customer_id,count(*) Total_rentals
from customer c join rental r 
on c.customer_id =r.customer_id
group by c.customer_id;

-- 7.How many action movies are present in the database
select c.category_id,c.name,count(*) Number_of_movies
from category c join film_category fc
on c.category_id=fc.category_id
group by c.category_id
having c.name='Action';

-- 8.Rental duration in days for each customer
select c.customer_id,datediff(return_date,rental_date) Days 
from customer c join rental r 
on c.customer_id=r.customer_id
group by c.customer_id;

-- 9.Find the films which are not present in the inventory by left join between film and inventory
select inventory_id,count(f.film_id)
from film f left join inventory i 
on f.film_id=i.film_id
where inventory_id is null;

-- 10.Find the sum of amount paid by customer id 155
select customer_id,sum(amount) from payment where customer_id=155;

-- 11.pull the firstname and lastname of customer and how many films rented in asc order
select c.customer_id,c.first_name,c.last_name,count(*) Total_films_rented
from customer c join rental r 
on c.customer_id=r.customer_id
group by c.customer_id
order by count(*) limit 1;

-- 12.Round the amounts of all the payment amount nearest integer
select amount,round(amount) from payment;

-- 13.From the tables city and country which has maximum cities
select co.Country_id,co.country,count(*) Number_of_Cities
from city ci join country co
on ci.country_id=co.country_id
group by co.country_id
order by count(*) desc;

-- 14.from the tables city and country whch country has minimum number of cities
select co.Country_id,co.country,count(*) Number_of_Cities
from city ci join country co
on ci.country_id=co.country_id
group by co.country_id
order by count(*) asc;

-- 15.how many categories of films are present
select film_id,count(category_id) number_of_category from film_category group by category_id;

-- 16.find the count of each film in the inventory.
-- Display the film-id and its count.sort by descending order of the count
select inventory_id,count(film_id) Total_films from inventory group by film_id order by film_id desc;

-- 17.How many films did the actor penelope guiness act in 
select a.actor_id,a.first_name,a.last_name,count(*) Total_films
from actor a join film_actor fa
on a.actor_id=fa.actor_id
group by a.actor_id
having a.first_name='penelope' and last_name='guiness';

-- 18.How many films did the actor Anne Cronyn act in 
select a.actor_id,a.first_name,a.last_name,count(*) Total_films
from actor a join film_actor fa
on a.actor_id=fa.actor_id
group by a.actor_id
having a.first_name='Anne' and last_name='Cronyn';

-- 19.find the customer id who paid the max total rental amount for all rentals
select customer_id,sum(amount) Total_amount from payment 
group by customer_id order by sum(amount) desc;






