select * from pizza_sales
select sum(total_price) as Total_revenue from pizza_sales
select sum(total_price)/count(distinct order_id) as Avg_order_value from pizza_sales
select sum(quantity) as Total_quantity_sold from pizza_sales
select count(distinct order_id) as Total_orders from pizza_sales
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) 
as decimal(10,2)) as decimal(10,2))  as Avg_pizzas_per_order from pizza_sales

select datename(dw,order_date)as order_day ,count(distinct order_id) as Total_orders 
from pizza_sales 
group by datename(dw,order_date) 

select datename(Month,order_date)as Month_name ,count(distinct order_id) as Total_orders 
from pizza_sales 
group by datename(MONTH,order_date)  order by Total_orders desc

select pizza_category,sum(total_price) as Total_sales,sum(total_price)*100/(select sum(total_price) 
from pizza_sales where month(order_date)=1) as PCT from pizza_sales where month(order_date)=1
group by pizza_category

select pizza_size,cast(sum(total_price) as decimal(10,2)) as Total_sales,cast(sum(total_price)*100/
(select sum(total_price) from pizza_sales) as decimal(10,2))  as PCT from pizza_sales where
month(order_date)=1 group by pizza_size

select pizza_size,cast(sum(total_price) as decimal(10,2)) as Total_sales,cast(sum(total_price)*100/(select 
sum(total_price) from pizza_sales where datepart(quarter,order_date)=1) as decimal(10,2)) as PCT from 
pizza_sales where datepart(quarter,order_date)=1 group by pizza_size order by pct desc

select top 5 pizza_name ,sum(total_price) as total_revenue from pizza_sales group by pizza_name
order by total_revenue 

select top 5 pizza_name ,sum(quantity) as total_quantity from pizza_sales group by pizza_name
order by  total_quantity desc

select top 5 pizza_name ,count(distinct order_id) as total_orders from pizza_sales group by pizza_name
order by  total_orders desc

select top 5 pizza_name ,sum(quantity) as total_pizzas_sold from pizza_sales
where month(order_date)=8 group by pizza_name
order by sum(quantity) asc

