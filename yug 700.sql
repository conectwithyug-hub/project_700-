-- 700 query project 


-- question 1 show customer table coloumns 
SELECT * FROM `customers (1)`;

-- question 2 show order table coloumns
select * from `orders (1)`;

-- question 3 show prodcut table coloumns 
select * from `products (1)` ;

-- question 4 show coustomer id and age 
select customer_id , age from `customers (1)` ;

-- question 5  show product name price 
select product_name , price from `products (1)`;

--  question 6 show customer from london city 
select * from `customers (1)`
where city = 'London' ;

-- question 7 show product price > 100 
select * from `products (1)`
where price > 100  ;

-- question 8 show product price < 50 
select * from `products (1)`
where price < 50 ;


-- question 9 Show products category = 'Home'.
select * from `products (1)`
where category = 'home';

--  question 10 Show products price between 50 and 200.
select * from `products (1)` 
where price between 50 and 200 ;

-- queseton 11 show order with quantity > 2
select * from `orders (1)`
where quantity > 2 ;

-- question 12 Show orders with payment method 'Card'. 
select * from `orders (1)` 
where  payment_method = 'Card' ;

-- question 13 Sort orders by order_date.
select * from `orders (1)`
order by order_date ;

-- question 14 Find max price product. 
select max(price) from `products (1)`;

-- question 15 Find min price product.
select min(price) from `products (1)`;

-- question 16 Find avg price product.
select avg(price) from `products (1)`;

-- question 17 Show customers whose city starts with 'L'.
select * from `customers (1)`
where city like 'L%' ;

-- question 18 Show customers whose city starts with 'm'.
select * from `customers (1)`
where city like 'M%' ;

-- question 19 Count customers in each city.
select city , count(*) as total_customer 
from `customers (1)`
group by city ; 

-- question 20 Count customers by gender. 
select gender , count(*) from `customers (1)`
group by gender ;

-- question 21 Find average age per city.
select city , avg(age) as average_age from `customers (1)`
group by city;

-- question 22 Find max age per city.
select city , max(age) as max_age from `customers (1)`
group by city;

-- question 23 Find min age per city.
select city , min(age) as min_age from `customers (1)`;


-- question 24 Count orders per customer.
select  customer_id , count(order_id) as count_customer 
from `orders (1)`
group by customer_id ;

-- question 25 Count orders per product.
select product_id , count(order_id) as product_customer 
from `orders (1)` 
group by product_id	;

-- question 26 Find total quantity per product.
select product_id, sum(quantity) from `orders (1)`
group by product_id;

-- question 27 Find total quantity per customer.
select customer_id , sum(quantity) from `orders (1)`
group by customer_id ;

-- quesetion 28 Find average quantity per order. 
select order_id , avg(quantity) from `orders (1)`
group by order_id ;

-- question 29 Find max quantity per product.
select product_id , max(quantity) from `orders (1)`
group by product_id ;

-- question 30 Find min quantity per product.
select product_id , min(quantity) from `orders (1)`
group by product_id;

-- question 31 Find cities having more than 10 customers.
select city , count(*) from `customers (1)`
group by city 
having count(*) >10 ;

-- question 32 Find categories having more than 5 products. 
select category , count(*) from `products (1)`
group by category 
having count(*) >5;

-- question 33 Join customers and orders.
select * from `customers (1)` as c 
inner join `orders (1)` as o 
on c.customer_id = o.customer_id ;

-- question 34 Show customer city with order id.

select c.city , o.order_id from `customers (1)` as c
inner join `orders (1)` as o 
ON c.customer_id = o.customer_id;

-- question 35 Show customer gender with order quantity.

select c.gender , o.quantity from `customers (1)` as c
inner join `orders (1)` as o 
ON c.customer_id = o.customer_id;

-- question 36 Show customer age with order date.
select c.age , o.order_date from `customers (1)` as c
inner join `orders (1)` as o 
ON c.customer_id = o.customer_id;


-- question 37 Show customers who placed orders.
select distinct c.city, o.customer_id from `customers (1)` as c
inner join `orders (1)` as o 
ON c.customer_id = o.customer_id;

-- question 38 Show customers who never ordered.
select c.city, o.customer_id from `customers (1)` as c
left join `orders (1)` as o 
ON c.customer_id = o.customer_id 
where order_id is null ;



-- question 39 Show orders with customer city.
select c.city, o.order_id from `customers (1)` as c
inner join `orders (1)` as o 
ON c.customer_id = o.customer_id;



-- question 40 Show orders with customer age.
select distinct c.age , o.order_id from `customers (1)` as c
inner join `orders (1)` as o 
ON c.customer_id = o.customer_id;


-- question 41 Show orders with loyalty status.
select distinct c.loyalty_member, o.order_id from `customers (1)` as c
inner join `orders (1)` as o 
ON c.customer_id = o.customer_id;



-- question 42 Show customers and their total orders.
select c.customer_id , count(o.order_id) as total_order from `customers (1)` c
left join `orders (1)` as o 
ON c.customer_id = o.customer_id
group by customer_id ;


 -- question 43 Join orders and products.
 select * from `orders (1)` as o
 inner join `products (1)` as p 
 on o.product_id = p.product_id	;
 

 -- question 44 Show product name with order quantity.
 select o.quantity , p.product_name from `orders (1)` as o
 inner join `products (1)` as p 
 on o.product_id = p.product_id	;
 

-- question 45 Show product category with order id.
select o.order_id , p.category from `orders (1)` as o
 inner join `products (1)` as p 
 on o.product_id = p.product_id	;
 

-- question 46 Show product price with order quantity.
select o.quantity,P.PRICE from `orders (1)` as o
 inner join `products (1)` as p 
 on o.product_id = p.product_id	;
 

-- question 47 Show products that were ordered.
select p.product_id	, p.product_name from `orders (1)` as o
 inner join `products (1)` as p 
 on o.product_id = p.product_id	;
 
 
-- question 48 Show product name with order quantity greater than 2.
select o.quantity	, p.product_name from `orders (1)` as o
 inner join `products (1)` as p 
 on o.product_id = p.product_id	
 where o.quantity > 2 ;
 


-- question 49 Show orders where product price is greater than 100.

Select o.order_id , p.price from `products (1)` as p
inner join `orders (1)` as o 
on o.product_id = p.product_id 
where p.price > 100 ;

-- question 50 Show orders for products in Beauty category.

Select o.order_id , p.category from `products (1)` as p
inner join `orders (1)` as o 
on o.product_id = p.product_id 
where p.category ='beauty' ;

-- question 51 Show orders for products in Electronics category.
Select o.order_id , p.category from `products (1)` as p
inner join `orders (1)` as o 
on o.product_id = p.product_id 
where p.category ='electronics' ;


-- question 52 Show product name with payment method used.
SELECT p.product_name, o.payment_method
FROM `orders (1)` o
JOIN `products (1)` p
ON o.product_id = p.product_id;

-- question 53 Show product category with order quantity.
SELECT p.category, o.quantity
FROM `orders (1)` o
JOIN `products (1)`p
ON o.product_id = p.product_id;

-- question 54 Show orders placed for products costing less than 50.
SELECT *
FROM `orders (1)` o
JOIN `products (1)`p
ON o.product_id = p.product_id
WHERE p.price < 50;

-- question 55 Show orders placed for products costing more than 200.
SELECT *
FROM `orders (1)` o
JOIN `products (1)`p
ON o.product_id = p.product_id
WHERE p.price > 200;

-- question 56 Show total quantity ordered for each product name.

select p.product_name , sum(o.quantity) as total_quantity from `orders (1)` as o
join `products (1)` as p 
on o.product_id = p.product_id 
group by p.product_name;

-- 57 Show total orders for each product category.
select category , count(order_id)
from `orders (1)` o 
join `products (1)` p 
on o.product_id=p.product_id
group by  category ;


-- 58 Show total orders for each city.
select city , count(order_id)
from `customers (1)`c
join `orders (1)`o
on c.customer_id = o.customer_id 
group by city ;



-- 59 Show average product price ordered by each city.
SELECT c.city, AVG(p.price) AS avg_price
FROM `orders (1)`o
JOIN `customers (1)` c ON o.customer_id = c.customer_id
JOIN `products (1)` p ON o.product_id = p.product_id
GROUP BY c.city;

-- 60 Show highest priced product ordered by customers.


SELECT MAX(p.price) AS highest_price
FROM `orders (1)` o
JOIN `products (1)`p ON o.product_id = p.product_id;

-- 62 Show product names ordered by loyalty members.
SELECT p.product_name
FROM `orders (1)` o
JOIN `customers (1)`c ON o.customer_id = c.customer_id
JOIN `products (1)` p ON o.product_id = p.product_id
WHERE c.loyalty_member = 'Yes';

-- 63 Show cities where Beauty products were ordered.
SELECT DISTINCT c.city
FROM `orders (1)`o
JOIN `customers (1)` c ON o.customer_id = c.customer_id
JOIN `products (1)` p ON o.product_id = p.product_id
WHERE p.category = 'Beauty';



-- 66 Count total customers.
select count(*) customer from `customers (1)`;

-- 67 Count total products.

select count(*) product_id from `products (1)`;

-- 68 Count total orders.
SELECT COUNT(*) AS total_orders
FROM `orders (1)`;

-- 69 Find max product price.
SELECT MAX(price) AS max_price
FROM `products (1)`;

-- 70 Find min product price.
select min(price) from `products (1)` ;

-- 71 Find average product price.
SELECT AVG(price) AS avg_price
FROM `products (1)`;

-- 72 Find max customer age.
SELECT MAX(age) AS max_age
FROM `customers (1)`;

-- 73 Find min customer age.

SELECT MIN(age) AS min_age
FROM `customers (1)`;

-- 74 Find average customer age.
SELECT AVG(age) AS avg_age
FROM `customers (1)`;

-- 75 Find total quantity ordered.
SELECT SUM(quantity) AS total_quantity
FROM `orders (1)`;

-- 76 Find total number of customers.
SELECT COUNT(*) AS total_customers
FROM `customers (1)`;

-- 77 Find total number of products in each category.
SELECT category, COUNT(*) AS total_products
FROM `products (1)`
GROUP BY category;

-- 78 Find total number of orders placed.
SELECT COUNT(*) AS total_orders
FROM `orders (1)`;

-- 79Find average quantity ordered.
SELECT AVG(quantity) AS avg_quantity
FROM `orders (1)`;

-- 80 Find maximum quantity ordered.
SELECT MAX(quantity) AS max_quantity
FROM `orders (1)`;

-- 81 Find minimum quantity ordered.
SELECT MIN(quantity) AS min_quantity
FROM `orders (1)`;

-- 82 Find total price of all products.
SELECT SUM(price) AS total_price
FROM products;
-- 83 Find average product price in Beauty category.
SELECT AVG(price) AS avg_price
FROM `products (1)`
WHERE category = 'Beauty';

-- 84 Find maximum price product in Electronics category.
SELECT MAX(price) AS max_price
FROM `products (1)`
WHERE category = 'Electronics';


-- 85 Find minimum price product in Home category.
SELECT MIN(price) AS min_price
FROM `products (1)`
WHERE category = 'Home';
 
 -- 86 Count customers in each city.
 select city , count(*) from `customers (1)`
 group by city ;

-- 87 Count orders per payment method.
select payment_method , count(*) from `orders (1)`
group by payment_method ;


-- 88 Count orders per product.
select category , count(*) from `products (1)`
group by category ;


-- 89 Find total quantity ordered per product.
SELECT product_id, SUM(quantity) AS total_quantity
FROM `orders (1)`
GROUP BY product_id;

-- 90 Find average price per product category.
SELECT category, AVG(price) AS avg_price
FROM `products (1)`
GROUP BY category;

-- 91 Find maximum price per category.
SELECT category, MAX(price) AS max_price
FROM `products (1)`
GROUP BY category;

-- 92 Find minimum price per category.
SELECT category, MIN(price) AS min_price
FROM `products (1)`
GROUP BY category;

-- 93 Find average customer age per city.
SELECT city, AVG(age) AS avg_age
FROM `customers (1)`
GROUP BY city;

-- 94 Find maximum age per city.
SELECT city, MAX(age) AS max_age
FROM `customers (1)`
GROUP BY city;

-- 95 Find minimum age per city.
SELECT city, MIN(age) AS min_age
FROM `customers (1)`
GROUP BY city;

-- 96 Count male and female customers.
select gender , count(*) from `customers (1)`
group by gender ;


-- 97 Find average age by gender.
select gender , avg(age) from `customers (1)`
 group by gender ;

-- 98 Find maximum age by gender.

select gender , max(age) from `customers (1)`
group by gender ;

-- 99 Find minimum age by gender.
SELECT gender, MIN(age) AS min_age
FROM `customers (1)`
GROUP BY gender;

-- 100 customers by loyalty_member status.
SELECT loyalty_member, COUNT(*) AS total_customers
FROM `customers (1)`
GROUP BY loyalty_member;

-- 101 Find average age of loyalty members vs non-members.
SELECT loyalty_member, AVG(age) AS avg_age
FROM `customers (1)`
GROUP BY loyalty_member;


-- 102 Count customers by signup year.
SELECT YEAR(signup_date) AS signup_year, COUNT(*) AS total_customers
FROM `customers (1)`
GROUP BY YEAR(signup_date);

-- 103 Find average age by signup year.
SELECT YEAR(signup_date) AS signup_year, AVG(age) AS avg_age
FROM `customers (1)`
GROUP BY YEAR(signup_date);

-- 104 Find maximum age by signup year.
SELECT YEAR(signup_date) AS signup_year, MAX(age) AS max_age
FROM `customers (1)`
GROUP BY year (signup_date);

select * from `customers (1)`; 

-- 105 Find minimum age by signup year.
SELECT year ( signup_date ) , min(age) from `customers (1)`
group by year (signup_date) ;

-- 106 Show customers whose age is greater than 40.
select * from `customers (1)`
where age > 40 ;


-- 107 Show customers whose age is less than 20.
select *
from `customers (1)`
where age < 20;

-- 108 Show customers whose age is between 25 and 35.
select *
from `customers (1)`
where age between 25 and 35;

-- 109 Show customers who live in London or Manchester.
select *
from `customers (1)`
where city = 'london' or city = 'manchester';

-- 110 Show customers who are loyalty members.
select *
from `customers (1)`
where loyalty_member = 'yes';

-- 111 Show customers who are not loyalty members.
select *
from `customers (1)`
where loyalty_member = 'no';

-- 112 Show products priced between 100 and 300.
select *
from `products (1)`
where price between 100 and 300;

-- 113 Show products priced below 20.
select *
from `products (1)`
where price < 20;

-- 114 Show products priced above 500.
select *
from `products (1)`
where price > 500;

-- 115 Show products not in category 'Beauty'.
select *
from `products (1)`
where category <> 'beauty';

 -- 116 Show customers whose city ends with 'n'.
 select * from `customers (1)`
 where  city like '%n' ;

-- 117 Show customers whose city contains 'o'.
select * from `customers (1)` 
where city like '%o' ;

-- 118 Show product names starting with 'C'.
select *
from `products (1)`
where product_name like 'c%';


-- 119 Show product names ending with 'r'.
select *
from `products (1)`
where product_name like '%r';

-- 120 Show product names containing 'Cream'.
select *
from `products (1)`
where product_name like '%cream%';

-- 121 Show cities starting with 'L'.
select *
from `orders (1)`
where city like 'l%';

-- 122 Show cities ending with 'd'.
select *
from `customers (1)`
where city like '%d';

-- 123 Show products containing 'Bottle'.
select *
from `products (1)`
where product_name like '%bottle%';

-- 124 Show customers whose city contains 'an'.
select *
from `customers (1)`
where city like '%an%';

-- 125 Show products whose name contains 'Phone'.
select *
from `products (1)`
where product_name like '%phone%';

-- 126 Sort customers by age descending.
select * from `customers (1)` 
order by age desc ;



-- 127 Sort customers by city ascending.
select * from `customers (1)`
order by age ASC

-- 128 Sort products by price descending.
select *
from `products (1)`
order by price desc;

-- 129 Sort products by category ascending.
select *
from `products (1)`
order by category asc;

-- 130 Sort orders by order_date descending.
select *
from `orders (1)`
order by order_date desc;

-- 131 Sort orders by quantity descending.
select *
from `orders (1)`
order by quantity desc;

-- 132 Sort customers by signup_date.
select *
from `customers (1)`
order by signup_date;

-- 133 Sort products by product_name.
select *
from `products (1)`
order by product_name;

-- 134 Sort customers by gender.
select *
from `customers (1)`
order by gender;

-- 135 Sort products by price ascending.
select *
from `products (1)`
order by price asc;

-- 136 Count customers in each gender.
select gender , count(*) from `customers (1)`
group by gender ;
-- 137 Count products in each category.
select category, count(*) as total_products
from `products (1)`
group by category;

-- 138 Count orders by payment method.
select payment_method, count(*) as total_orders
from `orders (1)`
group by payment_method;


-- 139 Find total quantity ordered by payment method.
select payment_method, sum(quantity) as total_quantity
from `orders (1)`
group by payment_method;

-- 140 Find average quantity ordered by payment method.
select payment_method, avg(quantity) as avg_quantity
from `orders (1)`
group by payment_method;

-- 141 Find maximum quantity ordered by payment method.
select payment_method, max(quantity) as max_quantity
from `orders (1)`
group by payment_method;

-- 142 Find minimum quantity ordered by payment method.
select payment_method, min(quantity) as min_quantity
from `orders (1)`
group by payment_method;

-- 143 Find average price by category.
select category, avg(price) as avg_price
from `products (1)`
group by category;
-- 144 Find maximum price by category.
select category, max(price) as max_price
from `products (1)`
group by category;

-- 145 Find minimum price by category.
select category, min(price) as min_price
from `products (1)`
group by category;

-- 146 count orders per order_date and payment_method.
select order_date, payment_method, count(*) as total_orders
from `orders (1)`
group by order_date, payment_method;

-- 147 find total quantity ordered per order_date.
select order_date, sum(quantity) as total_quantity
from `orders (1)`
group by order_date;

-- 148 find average quantity per order_date and payment_method.
select order_date, payment_method, avg(quantity) as avg_quantity
from `orders (1)`
group by order_date, payment_method;

-- 149 find maximum quantity per order_date.
select order_date, max(quantity) as max_quantity
from orders
group by order_date;

-- 150 count orders per customer_id and payment_method.
select customer_id, payment_method, count(*) as total_orders
from `orders (1)`
group by customer_id, payment_method;

-- 151 find total quantity per customer_id and payment_method.
select customer_id, payment_method, sum(quantity) as total_quantity
from `orders (1)`
group by customer_id, payment_method;

-- 152 find average quantity per customer_id.
select customer_id, avg(quantity) as avg_quantity
from `orders (1)`
group by customer_id;

-- 153 find maximum quantity per customer_id.
select customer_id, max(quantity) as max_quantity
from `orders (1)`
group by customer_id;

-- 154 find minimum quantity per customer_id.
select customer_id, min(quantity) as min_quantity
from `orders (1)`
group by customer_id;

-- 155 count products by category and price range.
select category, price, count(*) as total_products
from `products (1)`
group by category, price;

-- 156 find total price per category.
select category, sum(price) as total_price
from `products (1)`
group by category;

-- 157 find average price per category and product_name.
select category, product_name, avg(price) as avg_price
from `products (1)`
group by category, product_name;


-- 158 find maximum price per category and product_name.
select category, product_name, max(price) as max_price
from `products (1)`
group by category, product_name;

-- 159 find minimum price per category and product_name.
select category, product_name, min(price) as min_price
from `products (1)`
group by category, product_name;


-- 160 count products by price value.
select price, count(*) as total_products
from `products (1)`
group by price;

-- 161 find average price per product_name.
select product_name, avg(price) as avg_price
from `products (1)`
group by product_name;

-- 162 find maximum price per product_name.
select product_name, max(price) as max_price
from `products (1)`
group by product_name;

-- 163 find minimum price per product_name.
select product_name, min(price) as min_price
from `products (1)`
group by product_name;

-- 164 find total price per product_name.
select product_name, sum(price) as total_price
from `products (1)`
group by product_name;

-- 165 find total quantity ordered per product_id and payment_method.
select product_id , payment_method , sum(quantity) as total_quantity 
from `orders (1)`
group by product_id	, payment_method;

-- 166 find average quantity ordered per product_id.
select product_id , avg(quantity) as avg_quantity  from `orders (1)`
group by product_id ;


-- 167 find maximum quantity ordered per product_id.
select product_id, max(quantity) as max_quantity
from `orders (1)`
group by product_id;

-- 168 find minimum quantity ordered per product_id.
select product_id, min(quantity) as min_quantity
from `orders (1)`
group by product_id;

-- 169 count orders per product_id and order_date.
select product_id, order_date, count(*) as total_orders
from `orders (1)`
group by product_id, order_date;


-- 170 find total quantity ordered per city.
select city, sum(quantity) as total_quantity
from `customers (1)`
join orders on customers.customer_id = orders.customer_id
group by city;

-- 171 find average quantity ordered per city.
select city, avg(quantity) as avg_quantity
from `customers (1)`
join orders on customers.customer_id = orders.customer_id
group by city;

-- 172 find maximum quantity ordered per city.
select city , max(quantity) from `customers (1)` c
join `orders (1)` o  on c.customer_id=o.customer_id 
group by city ; 

-- 173 find minimum quantity ordered per city.
select city, min(quantity) as min_quantity
from `customers (1)`
join orders on customers.customer_id = orders.customer_id
group by city;
-- 174 count orders per city.
select city, count(*) as total_orders
from `customers (1)`
join orders on customers.customer_id = orders.customer_id
group by city;

-- 175 count total orders for each product_name.
select product_name, count(*) as total_orders
from `products (1)`
join `orders (1)` 
on `products (1)`.product_id = `orders (1)`.product_id
group by product_name;

-- 176 find total quantity ordered per product_name.
select product_name, sum(quantity) as total_quantity
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by product_name;

-- 177 find average quantity ordered per product_name.
select product_name, avg(quantity) as avg_quantity
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by product_name;

-- 178 find maximum quantity ordered per product_name.
select product_name, max(quantity) as max_quantity
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by product_name;

-- 179 find minimum quantity ordered per product_name.
select product_name, min(quantity) as min_quantity
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by product_name;

-- 180 count total orders per category.
select category, count(*) as total_orders
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by category;

-- 181 find total quantity ordered per category.
select category, sum(quantity) as total_quantity
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by category;

-- 182 find average quantity ordered per category.
select category, avg(quantity) as avg_quantity
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by category;

-- 183 find maximum quantity ordered per category.
select category, max(quantity) as max_quantity
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by category;

-- 184 find minimum quantity ordered per category.

select category, min(quantity) as min_quantity
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by category;

-- 185 find total revenue per product_name.
select product_name , sum(price * quantity ) as total_revenue 
from `orders (1)` o 
join `products (1)` p 
on o.product_id = p.product_id 
group by product_name ;


-- 186 find average revenue per product_name.
select  product_name , avg(price * quantity ) as avg_revenue 
from `orders (1)` o 
join `products (1)` p 
on o.product_id = p.product_id 
group by product_name ;


-- 187 find maximum revenue per product_name.
select product_name, max(price * quantity) as max_revenue
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by product_name;

-- 188 find minimum revenue per product_name.
select product_name, min(price * quantity) as min_revenue
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by product_name;

-- 189 find total revenue per category.
select category, sum(price * quantity) as total_revenue
from `products (1)`
join `orders (1)`
on `products (1)`.product_id = `orders (1)`.product_id
group by category;

-- 190 count orders per city.
select city, count(*) as total_orders
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by city;

-- 191 find total quantity ordered per city.
select city, sum(quantity) as total_quantity
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by city;

-- 192 find average quantity ordered per city.
select city, avg(quantity) as avg_quantity
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by city;

-- 193 find maximum quantity ordered per city.
select city, max(quantity) as max_quantity
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by city;


-- 194 find minimum product price ordered per city.
select city, min(quantity) as min_quantity
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by city;

-- 195 count distinct products ordered per city.
select city, count(distinct product_id) as distinct_products
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by city;

-- 196 count orders per payment_method and category.
select payment_method, category, avg(quantity) as avg_quantity
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by payment_method, category;

-- 197 find total quantity ordered per payment_method and category.
select payment_method, category, sum(quantity) as total_quantity
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by payment_method, category;

-- 198 find average quantity ordered per payment_method and category.
select payment_method, category, avg(quantity) as avg_quantity
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by payment_method, category;


-- 199 find maximum quantity ordered per payment_method and category.
select payment_method, category, max(quantity) as max_quantity
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by payment_method, category;

-- 200 find minimum quantity ordered per payment_method and category.
select payment_method, category, min(quantity) as min_quantity
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by payment_method, category;

-- 201 find total revenue per payment_method.
select payment_method, sum(price * quantity) as total_revenue
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by payment_method;

-- 202 find average revenue per payment_method.
select payment_method, avg(price * quantity) as avg_revenue
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by payment_method;

-- 203 find maximum revenue per payment_method.
select payment_method, max(price * quantity) as max_revenue
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by payment_method;

-- 204 find minimum revenue per payment_method.
select payment_method, min(price * quantity) as min_revenue
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by payment_method;

-- 205 count orders per payment_method and city.
select payment_method, city, count(*) as total_orders
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by payment_method, city;

-- 206 find total quantity ordered per customer_id and city.
select o.customer_id , c.city , sum(o.quantity) from `customers (1)` c
join `orders (1)` o 
on o.customer_id=c.customer_id 
group by o.customer_id , c.city ;

-- i treid so many time to solve the error but i cant do it so this query contain an error

-- 207 find average quantity ordered per customer_id and city.
select `orders (1)`.customer_id, `customers (1)`.city, avg(`orders (1)`.quantity) as avg_quantity
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by `orders (1)`.customer_id, `customers (1)`.city;



-- 208 find maximum quantity ordered per customer_id and city.
select `orders (1)`.customer_id, `customers (1)`.city, max(`orders (1)`.quantity) as max_quantity
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by `orders (1)`.customer_id, `customers (1)`.city;


-- 209 find minimum quantity ordered per customer_id and city.
select customer_id, city, min(quantity) as min_quantity
from `customers (1)`
join `orders (1)`
on `customers (1)`.customer_id = `orders (1)`.customer_id
group by customer_id, city;

-- 210 count orders per customer_id and city.
select o.customer_id, c.city, count(*) as total_orders
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by o.customer_id, c.city;
-- 211 find total revenue per customer_id.
select customer_id, sum(price * quantity) as total_revenue
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by customer_id;

-- 212 find average revenue per customer_id.
select customer_id, avg(price * quantity) as avg_revenue
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by customer_id;

-- 213 find maximum revenue per customer_id.
select customer_id, max(price * quantity) as max_revenue
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by customer_id;

-- 214 find minimum revenue per customer_id.
select customer_id, min(price * quantity) as min_revenue
from `orders (1)`
join `products (1)`
on `orders (1)`.product_id = `products (1)`.product_id
group by customer_id;

-- 215 count distinct products ordered per customer_id.
select customer_id, count(distinct product_id) as distinct_products
from `orders (1)`
group by customer_id;

-- 216 find total orders per category and city.
-- find total orders per category and city
select p.category, c.city, count(o.order_id) as total_orders
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id
group by p.category, c.city;
-- 217  show customer city and order quantity
select c.city, o.quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id;

-- 218 show customer city and payment method
select c.city, o.payment_method
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id;

-- 219  show product name and order quantity
select p.product_name, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 220 show product category and payment method
select p.category, o.payment_method
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 221  show customer city and product name
select c.city, p.product_name
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 222 show customer city and product category
select c.city, p.category
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 223 show product price and order quantity
select p.price, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 224 show product name and payment method
select p.product_name, o.payment_method
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 225 show city and product price
select c.city, p.price
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 226 show city, product name and quantity
select c.city, p.product_name, o.quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 227 find total revenue per product
select p.product_name, sum(p.price * o.quantity) as revenue
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.product_name;

-- 228 find average revenue per product
select p.product_name, avg(p.price * o.quantity) as revenue
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.product_name;

-- 229 find maximum revenue per product
select p.product_name, max(p.price * o.quantity)
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.product_name;

-- 230 find minimum revenue per product
select p.product_name, min(p.price * o.quantity)
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.product_name;

-- 231 total revenue per category
select p.category, sum(p.price * o.quantity)
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.category;

-- 232 average revenue per category
select p.category, avg(p.price * o.quantity)
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.category;

-- 233 max revenue per category
select p.category, max(p.price * o.quantity)
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.category;

-- 78 min revenue per category
select p.category, min(p.price * o.quantity)
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.category;

-- 234  total revenue per city
select c.city, sum(p.price * o.quantity)
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id
group by c.city;

-- 235  average revenue per city
select c.city, avg(p.price * o.quantity)
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id
group by c.city;

-- 236  count orders per city
select c.city, count(*) as total_orders
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 237 total quantity ordered per city
select c.city, sum(o.quantity) as total_quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 238 average quantity ordered per city
select c.city, avg(o.quantity) as avg_quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 239 maximum quantity ordered per city
select c.city, max(o.quantity) as max_quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 240 minimum quantity ordered per city
select c.city, min(o.quantity) as min_quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 241 count orders per category
select p.category, count(*) as total_orders
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.category;

-- 242 total quantity ordered per category
select p.category, sum(o.quantity) as total_quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.category;

-- 243  average quantity ordered per category
select p.category, avg(o.quantity) as avg_quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.category;

-- 244 maximum quantity ordered per category
select p.category, max(o.quantity) as max_quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.category;

-- 245 minimum quantity ordered per category
select p.category, min(o.quantity) as min_quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
group by p.category;

-- 246 count distinct products ordered per city
select c.city, count(distinct o.product_id)
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 247 count distinct products ordered per customer
select customer_id, count(distinct product_id)
from `orders (1)`
group by customer_id;

-- 248 total quantity ordered per product
select product_id, sum(quantity)
from `orders (1)`
group by product_id;

-- 249 average quantity ordered per product
select product_id, avg(quantity)
from `orders (1)`
group by product_id;

-- 85 max quantity ordered per product
select product_id, max(quantity)
from `orders (1)`
group by product_id;

-- 250 min quantity ordered per product
select product_id, min(quantity)
from `orders (1)`
group by product_id;

-- 251 count orders per order_date
select order_date, count(*)
from `orders (1)`
group by order_date;

-- 252  total quantity per order_date
select order_date, sum(quantity)
from `orders (1)`
group by order_date;

-- 253 average quantity per order_date
select order_date, avg(quantity)
from `orders (1)`
group by order_date;

-- 254 max quantity per order_date
select order_date, max(quantity)
from `orders (1)`
group by order_date;

-- 255 min quantity per order_date
select order_date, min(quantity)
from `orders (1)`
group by order_date;

-- 256 count orders per payment method and city
select c.city, o.payment_method, count(*)
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city, o.payment_method;

-- 257 total quantity per payment method and city
select c.city, o.payment_method, sum(o.quantity)
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city, o.payment_method;

-- 258 avg quantity per payment method and city
select c.city, o.payment_method, avg(o.quantity)
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city, o.payment_method;

-- 259 max quantity per payment method and city
select c.city, o.payment_method, max(o.quantity)
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city, o.payment_method;

-- 260 min quantity per payment method and city
select c.city, o.payment_method, min(o.quantity)
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city, o.payment_method;

-- 261 count products per price
select price, count(*)
from `products (1)`
group by price;

-- 262 average price per category
select category, avg(price)
from `products (1)`
group by category;

-- 263 max price per category
select category, max(price)
from `products (1)`
group by category;

-- 264 min price per category
select category, min(price)
from `products (1)`
group by category;

-- 265 show product name and order quantity
select p.product_name, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 266 show product name and payment method
select p.product_name, o.payment_method
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 267 show product price and order_id
select p.price, o.order_id
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 268 show product category and order_id
select p.category, o.order_id
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 269 show customer city and order quantity
select c.city, o.quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id;

-- 270 show customer city and order date
select c.city, o.order_date
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id;

-- 271 show customer city and payment method
select c.city, o.payment_method
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id;

-- 272 show customer city and order_id
select c.city, o.order_id
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id;

-- 273 show product name and customer city
select p.product_name, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 274 show product price and customer city
select p.price, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 275 show product category and customer city
select p.category, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 276 show product name and order date
select p.product_name, o.order_date
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 277 show order_id and product name
select o.order_id, p.product_name
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 278 show order_id and product category
select o.order_id, p.category
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 279 show order_id and product price
select o.order_id, p.price
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 280 show order quantity and product name
select o.quantity, p.product_name
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 281 show order quantity and product category
select o.quantity, p.category
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 282 show order quantity and product price
select o.quantity, p.price
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 283 show order date and product name
select o.order_date, p.product_name
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 284 show payment method and product name
select o.payment_method, p.product_name
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 285 show payment method and product category
select o.payment_method, p.category
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 286 show payment method and product price
select o.payment_method, p.price
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 287 show customer city and product name
select c.city, p.product_name
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 288 show customer city and product category
select c.city, p.category
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 289 show customer city and product price
select c.city, p.price
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 290 show customer city and order quantity
select c.city, o.quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id;

-- 291 show order date and customer city
select o.order_date, c.city
from `orders (1)` o
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 292 show payment method and customer city
select o.payment_method, c.city
from `orders (1)` o
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 293 show order quantity and customer city
select o.quantity, c.city
from `orders (1)` o
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 294 show order_id and customer city
select o.order_id, c.city
from `orders (1)` o
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 295 show product category and order date
select p.category, o.order_date
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 296 show product price and order date
select p.price, o.order_date
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 297 show product name and order_id
select p.product_name, o.order_id
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 298 show product category and payment method
select p.category, o.payment_method
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 299 show product price and payment method
select p.price, o.payment_method
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 300 show product name and payment method
select p.product_name, o.payment_method
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 301 show customer city and product name
select c.city, p.product_name
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 302 show customer city and product category
select c.city, p.category
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 303 show customer city and product price
select c.city, p.price
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 304 show product name and customer city
select p.product_name, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 305 show product category and customer city
select p.category, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 306 show product price and customer city
select p.price, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 307 show product name and order quantity
select p.product_name, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 308 show product category and order quantity
select p.category, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 309 show product price and order quantity
select p.price, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 310 show order date and product category
select o.order_date, p.category
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 311 show order date and product price
select o.order_date, p.price
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 312 show order quantity and product name
select o.quantity, p.product_name
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 313 show order quantity and customer city
select o.quantity, c.city
from `orders (1)` o
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 314 show payment method and product price
select o.payment_method, p.price
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 315 show products with price greater than 100
select * from `products (1)`
where price > 100;

-- 316 show orders with quantity greater than 5
select * from `orders (1)`
where quantity > 5;

-- 317 show customers from city london
select * from `customers (1)`
where city = 'london';

-- 318 show products in electronics category
select * from `products (1)`
where category = 'electronics';

-- 319 show orders paid by card
select * from `orders (1)`
where payment_method = 'card';

-- 320 show products with price between 50 and 200
select * from `products (1)`
where price between 50 and 200;

-- 321 show orders with quantity between 2 and 10
select * from `orders (1)`
where quantity between 2 and 10;

-- 322 show products sorted by price
select * from `products (1)`
order by price;

-- 323 show orders sorted by quantity
select * from `orders (1)`
order by quantity;

-- 324 show customers sorted by city
select * from `customers (1)`
order by city;

-- 325 show product name and quantity ordered
select p.product_name, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 326 show product category and quantity ordered
select p.category, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 327 show customer city and product name
select c.city, p.product_name
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
join `products (1)` p
on o.product_id = p.product_id;

-- 328 show order date and product name
select o.order_date, p.product_name
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 329 show payment method and customer city
select o.payment_method, c.city
from `orders (1)` o
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 330 show product category and customer city
select p.category, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 331 count products per category
select category, count(*) 
from `products (1)`
group by category;

-- 332 total quantity per payment method
select payment_method, sum(quantity)
from `orders (1)`
group by payment_method;

-- 333 average price per category
select category, avg(price)
from `products (1)`
group by category;

-- 334 max quantity per payment method
select payment_method, max(quantity)
from `orders (1)`
group by payment_method;

-- 335 min price per category
select category, min(price)
from `products (1)`
group by category;

-- 336 count customers per city
select city, count(*)
from `customers (1)`
group by city;

-- 337 total quantity per product
select product_id, sum(quantity)
from `orders (1)`
group by product_id;

-- 338 average quantity per product
select product_id, avg(quantity)
from `orders (1)`
group by product_id;

-- 339 max price per category
select category, max(price)
from `products (1)`
group by category;

-- 340 min quantity per product
select product_id, min(quantity)
from `orders (1)`
group by product_id;


-- WINDOW / PARTITION QUERIES

-- 341 rank products by price within category
select product_name, category, price,
rank() over(partition by category order by price desc) as price_rank
from `products (1)`;

-- 342 row number of orders per customer
select order_id, customer_id,
row_number() over(partition by customer_id order by order_date) as order_number
from `orders (1)`;

-- 343 rank orders by quantity per product
select product_id, quantity,
rank() over(partition by product_id order by quantity desc) as quantity_rank
from `orders (1)`;

-- 344 total quantity per product using window
select product_id, quantity,
sum(quantity) over(partition by product_id) as total_product_quantity
from `orders (1)`;

-- 345 average quantity per product using window
select product_id, quantity,
avg(quantity) over(partition by product_id) as avg_quantity
from `orders (1)`;

-- 346 max price per category using window
select product_name, category, price,
max(price) over(partition by category) as max_category_price
from `products (1)`;

-- 347 min price per category using window
select category , price , min(price) over(partition by	category order by price asc ) as min_price_category 
from `products (1)` ;

-- 348 running total quantity per product
select product_id, quantity,
sum(quantity) over(partition by product_id order by order_id) as running_total
from `orders (1)`;

-- 349 dense rank products by price in category
select product_name, category, price,
dense_rank() over(partition by category order by price desc) as dense_price_rank
from `products (1)`;

-- 350 row number of products in each category
select product_name, category,
row_number() over(partition by category order by product_name) as row_num
from `products (1)`;

-- 351 show orders with quantity greater than average
select *
from `orders (1)`
where quantity > (select avg(quantity) from `orders (1)`);

-- 352 show products priced above average
select *
from `products (1)`
where price > (select avg(price) from `products (1)`);

-- 353 show customers from cities starting with l
select *
from `customers (1)`
where city like 'l%';

-- 354 show products ending with r
select *
from `products (1)`
where product_name like '%r';

-- 355 show orders with payment method not cash
select *
from `orders (1)`
where payment_method != 'cash';

-- 356 show top 5 expensive products
select *
from `products (1)`
order by price desc
limit 5;

-- 357 show lowest 5 priced products
select *
from `products (1)`
order by price
limit 5;

-- 358 show latest 5 orders
select *
from `orders (1)`
order by order_date desc
limit 5;

-- 359 show first 5 customers
select *
from `customers (1)`
limit 5;

-- 360 show distinct cities
select distinct city
from `customers (1)`;

-- 361 show distinct categories
select distinct category
from `products (1)`;

-- 362 count distinct payment methods
select count(distinct payment_method)
from `orders (1)`;

-- 363 count distinct product ordered
select count(distinct product_id)
from `orders (1)`;

-- 364 show products with price not between 50 and 150
select *
from `products (1)`
where price not between 50 and 150;

-- 365 show products with price greater than 120
select * 
from `products (1)`
where price > 120;

-- 366 show orders with quantity greater than 6
select * 
from `orders (1)`
where quantity > 6;

-- 367 show customers from city berlin
select * 
from `customers (1)`
where city = 'berlin';

-- 368 show products with price less than 60
select * 
from `products (1)`
where price < 60;

-- 369 show orders paid by upi
select * 
from `orders (1)`
where payment_method = 'upi';

-- 370 show products whose name starts with m
select * 
from `products (1)`
where product_name like 'm%';

-- 371 show customers whose city starts with b
select * 
from `customers (1)`
where city like 'b%';

-- 372 show products whose name ends with e
select * 
from `products (1)`
where product_name like '%e';

-- 373 show orders with quantity between 3 and 8
select * 
from `orders (1)`
where quantity between 3 and 8;

-- 374 show products with price between 40 and 150
select * 
from `products (1)`
where price between 40 and 150;

-- 375 sort products by product_name
select * 
from `products (1)`
order by product_name;

-- 376 sort orders by order_id
select * 
from `orders (1)`
order by order_id;

-- 377 sort customers by city descending
select * 
from `customers (1)`
order by city desc;

-- 378 show products ordered by category
select * 
from `products (1)`
order by category;

-- 379 show orders ordered by payment method
select * 
from `orders (1)`
order by payment_method;

-- 380 count orders per product_id
select product_id, count(*) as total_orders
from `orders (1)`
group by product_id;

-- 381 total quantity per order_date
select order_date, sum(quantity) as total_quantity
from `orders (1)`
group by order_date;

-- 382 average quantity per order_date
select order_date, avg(quantity) as avg_quantity
from `orders (1)`
group by order_date;

-- 383 max quantity per order_date
select order_date, max(quantity) as max_quantity
from `orders (1)`
group by order_date;

-- 384 min quantity per order_date
select order_date, min(quantity) as min_quantity
from `orders (1)`
group by order_date;

-- 385 count products per category
select category, count(*) as total_products
from `products (1)`
group by category;

-- 386 average price per category
select category, avg(price) as avg_price
from `products (1)`
group by category;

-- 387 max price per category
select category, max(price) as max_price
from `products (1)`
group by category;

-- 388 min price per category
select category, min(price) as min_price
from `products (1)`
group by category;

-- 389 total price per category
select category, sum(price) as total_price
from `products (1)`
group by category;

-- 390 show product name and order quantity
select p.product_name, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 391 show product category and order quantity
select p.category, o.quantity
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 392 show product price and order date
select p.price, o.order_date
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id;

-- 393 show customer city and order quantity
select c.city, o.quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id;

-- 394 show customer city and payment method
select c.city, o.payment_method
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id;

-- 395 show product name and customer city
select p.product_name, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 396 show product category and customer city
select p.category, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 397 show product price and customer city
select p.price, c.city
from `products (1)` p
join `orders (1)` o
on p.product_id = o.product_id
join `customers (1)` c
on o.customer_id = c.customer_id;

-- 398 show payment method and product name
select o.payment_method, p.product_name
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 399 show payment method and product category
select o.payment_method, p.category
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 400 show payment method and product price
select o.payment_method, p.price
from `orders (1)` o
join `products (1)` p
on o.product_id = p.product_id;

-- 401 count orders per city
select c.city, count(*) as total_orders
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 402 total quantity per city
select c.city, sum(o.quantity) as total_quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 403 average quantity per city
select c.city, avg(o.quantity) as avg_quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 404 max quantity per city
select c.city, max(o.quantity) as max_quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 405 min quantity per city
select c.city, min(o.quantity) as min_quantity
from `customers (1)` c
join `orders (1)` o
on c.customer_id = o.customer_id
group by c.city;

-- 406 show products above average price
select *
from `products (1)`
where price > (select avg(price) from `products (1)`);

-- 407 show products below average price
select *
from `products (1)`
where price < (select avg(price) from `products (1)`);

-- 408 show orders above average quantity
select *
from `orders (1)`
where quantity > (select avg(quantity) from `orders (1)`);

-- 409 show orders below average quantity
select *
from `orders (1)`
where quantity < (select avg(quantity) from `orders (1)`);

-- 410 show top 4 expensive products
select *
from `products (1)`
order by price desc
limit 4;

-- 411 show lowest 4 priced products
select *
from `products (1)`
order by price
limit 4;

-- 412 show latest 4 orders
select *
from `orders (1)`
order by order_date desc
limit 4;

-- 413 show first 4 customers
select *
from `customers (1)`
limit 4;

-- 414 show distinct categories
select distinct category
from `products (1)`;
