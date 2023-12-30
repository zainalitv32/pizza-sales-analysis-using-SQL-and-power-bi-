select*from piza_sales
------total revenue
select round(sum(total_price),2) as total_revenue from piza_sales
----avg_order_value
select round(sum(total_price)/count(distinct order_id) ,2)as avg_order_value from piza_sales
----quantity sold by pizza size
select pizza_size, sum(quantity) as total_pizza_sold from piza_sales group by pizza_size
----total_quantity sold
select  sum(quantity) as total_quantity_sold from piza_sales
----analyze the  quantity sold by pizza categories
select pizza_category,   count(quantity) as total_quantity_sold from  pizza_sale group by  pizza_category
----total placed order
select count(distinct order_id) as total_placed_order from piza_sales
----avg_pizza_per_order
select sum(quantity)/count(distinct order_id) as avg_pizza_per_order from piza_sales
----analyze the quantity sold in different days 
select DATENAME(DW,order_date) as order_day,count(distinct order_id) as quantity_sold from piza_sales group by  DATENAME(DW,order_date)
----analyze the quantity sold in months
select DATENAME(month,order_date) as order_month,count(distinct order_id) as quantity_sold from piza_sales group by  DATENAME(month,order_date)
----analyze the quantity sold   by months and category
select pizza_category, DATENAME(month,order_date) as order_month,count(distinct order_id) as quantity_sold from piza_sales group by  DATENAME(month,order_date),pizza_category

select datename(month,order_date) as months, count(quantity) as quantity_sold from piza_sales 
group by datename(month,order_date) order by quantity_sold desc
----%of sales by categories
select pizza_category,sum(total_price)*100/(select sum(total_price) from piza_sales) as PCT from piza_sales group by pizza_category
----top 10 pizza that generate highest revenue
select top 10 pizza_name,sum(total_price) as total_revenue from piza_sales group by pizza_name order by total_revenue desc
----top pizza that sold highest quantities
select top 10 pizza_name,sum(quantity) as total_quantities from piza_sales group by pizza_name order by total_quantities desc

select top 10 pizza_name,count(distinct order_id) as total_orders from piza_sales group by pizza_name order by total_orders 
