--1- write a query to get region wise count of return orders

select 
region
,count(R.order_id) as return_orders_count
from returns R left join superstore_orders S
on R.order_id = S.order_id
group by region

--2- write a query to get category wise sales of orders that were not returned
select * from Superstore_orders
select * from returns

select 
category
,sum(sales) as category_sales
from Superstore_orders S left join returns R 
on S.order_id=R.order_id
where R.order_id IS  NULL
group by category

--3- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)

select * from Superstore_orders
select * from Returnsnew

select 
Sub_Category
from superstore_orders S
left join Returnsnew R
on S.order_id = R.order_id
where return_reason in ('others','bad quality','wrong items')
group by Sub_Category


--4- write a query to find cities where not even a single order was returned.

select S.city 
from Superstore_orders S left join Returnsnew R
on S.Order_ID = R.order_id
where R.order_id IS NULL
group by S.city 