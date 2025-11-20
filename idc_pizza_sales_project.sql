create database IDC_Pizza;
select*from order_details; -- order_details_id,order_id,pizza_id,quantity
select*from orders; -- order_id,date,time
select*from pizza_types; -- pizza_type_id,name,category,ingredients
select*from pizzas;  -- pizza_id,pizza_type_id,size,price 

## **Questions**
-- **Phase 1: Foundation & Inspection**

-- 1.Install IDC_Pizza.dump as IDC_Pizza server
-- 2. List all unique pizza categories (`DISTINCT`).
select distinct category from pizza_types;
-- 3. Display `pizza_type_id`, `name`, and ingredients, replacing NULL ingredients with `"Missing Data"`. Show first 5 rows
select pizza_type_id,name,coalesce(ingredients, 'Missing Data') as ingredients from pizza_types limit 5;
-- 4. Check for pizzas missing a price (`IS NULL`).
select price from pizzas where price is null ;

-- **Phase 2: Filtering & Exploration**
-- 1. Orders placed on `'2015-01-01'` (`SELECT` + `WHERE`).
select order_id,date from orders where date="2015-01-01";
-- 2. List pizzas with `price` descending.
select pizza_id,price from pizzas order by price desc ;
-- 3. Pizzas sold in sizes `'L'` or `'XL'`.
select pizza_id,size from pizzas where size="L" or size="XL";
select pizza_id,size from pizzas where size in ("L","XL") ;
-- 4. Pizzas priced between $15.00 and $17.00.
select pizza_id,price from pizzas where price between 15.00 and 17.00;
-- 5. Pizzas with `"Chicken"` in the name.
select * from pizza_types where category like "%Chicken%";
-- 6. Orders on `'2015-02-15'` or placed after 8 PM.
select date,time from orders where date="2015-02-15" or time>"20:00:00" ;

-- **Phase 3: Sales Performance**

-- 1. Total quantity of pizzas sold (`SUM`).
select sum(quantity) total_pizzas_sold from order_details;
-- 2. Average pizza price (`AVG`).
select avg(price) as avg_pizza_price from pizzas ;
-- 3. Total order value per order (`JOIN`, `SUM`, `GROUP BY`).
select o.order_id,sum(p.price*o.quantity) as total_order_vale from pizzas as p inner join order_details as o on p.pizza_id=o.pizza_id
group by o.order_id ;
-- 4. Total quantity sold per pizza category (`JOIN`, `GROUP BY`).
select pt.category,sum(o.quantity) as total_quantity from order_details as o inner join pizzas as p on p.pizza_id=o.pizza_id
inner join pizza_types as pt on p.pizza_type_id=pt.pizza_type_id group by pt.category ;
-- 5. Categories with more than 5,000 pizzas sold (`HAVING`).
select pt.category,sum(od.quantity) as total_qty from order_details od
inner join pizzas p on od.pizza_id = p.pizza_id
inner join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
group by pt.category having sum(od.quantity) > 5000;
-- 6. Pizzas never ordered (`LEFT/RIGHT JOIN`).
select p.pizza_id from pizzas as p left join order_details as o on p.pizza_id=o.pizza_id where o.order_id is null ;
-- 7. Price differences between different sizes of the same pizza (`SELF JOIN`).
select p1.pizza_id as pizza1,p1.size as size1,p1.price AS price1,
p2.pizza_id as pizza2,p2.size as size2,p2.price as price2,(p2.price - p1.price) as price_difference
from  pizzas p1 inner join pizzas p2 on p1.pizza_type_id = p2.pizza_type_id
 and p1.size < p2.size;   -- prevents duplicates
