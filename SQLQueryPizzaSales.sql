/* total revenue */

/* average order value */

select sum(total_price)/count(distinct order_id) avg_order_value from pizza_sales

/*total pizza sold */

select sum(quantity) Total_pizza_sold from pizza_sales

/*total order placed */

select count(distinct order_id) Total_orders from pizza_sales

/*Average pizzas per order */

select cast(sum(quantity)as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) avg_pizza_per_order from pizza_sales

/*daily trend for total orders */

select datename(dw, order_date) week_day,count(distinct order_id) total_orders from pizza_sales
group by datename(dw, order_date)

/*Monthly trend for total orders */

select datename(month, order_date) month_name,count(distinct order_id) total_orders from pizza_sales
group by datename(month, order_date)
order by total_orders desc

/*percentage of sales by pizza category */

select pizza_category, sum(total_price)*100/
(select sum(total_price) from pizza_sales) percent_of_sales from pizza_sales
group by pizza_category

/*percentage of sales by pizza size */

select pizza_size, round(sum(total_price)*100/
(select sum(total_price) from pizza_sales),2) percent_of_sales from pizza_sales
group by pizza_size
order by percent_of_sales desc

/*top 5 best sellers by revenue,total quantity and total orders */

select top 5 pizza_name,sum(total_price) total_revenue from pizza_sales
group by pizza_name
order by total_revenue 

select top 5 pizza_name,sum(quantity) total_quantity from pizza_sales
group by pizza_name
order by total_quantity 

select top 5 pizza_name,count(distinct order_id) total_orders from pizza_sales
group by pizza_name
order by total_orders 