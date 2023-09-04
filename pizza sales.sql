SELECT * FROM pizza_db.pizza_sales_excel_file;

/* --- 1. Total Revenue: The sum of the total price of all pizza orders ---*/
select sum(quantity*unit_price) as total_revenue from pizza_sales_excel_file;


/*--- 2. Average Order Value: The average amount spent per order, calculated by 
 dividing the total revenue by the total number of orders.*/
 
 select sum(quantity*unit_price)/count(quantity) as Average_Order_Value  from pizza_sales_excel_file;
 
 
/*---- 3. Total Pizzas Sold: The sum of the quantities of all pizza sold.------*/

select pizza_name, sum(quantity) as quantities_of_pizza_sold from pizza_sales_excel_file ;


/*--- 4. Total Orders: The total number of orders placed.-----*/
select sum(quantity) as total_orders from pizza_sales_excel_file;


/*---- 5. Average Pizza Per Order: The average number of pizzas sold per order,
calculated by dividing the total number of pizzas sold by the total number of
orders----*/

select order_id, count(quantity)as number_of_pizza_sold from pizza_sales_excel_file group 
 by  order_id;
 
 
 
 
/* --- Daily trend for total Orders ---*/
select order_date, count(distinct order_id) as daily_orders 
from pizza_sales_excel_file
 group by order_date ;
 
/*--- 2. Monthly Trend for Total Order----*/
select order_date, count(order_id) as monthly_orders  from pizza_sales_excel_file group by order_date asc;


/*---- Percentage of Sales by Pizza Category:----*/
select pizza_category, round(sum(total_price)/ (select sum(total_price) 
   from pizza_sales_excel_file) *100, 2) as per_of_sales from 
pizza_sales_excel_file
 group by pizza_category;

/* ---- Percentage of Sales by Pizza Size: ----*/

select pizza_size, round(sum(total_price)/(select sum(total_price)
 from 
pizza_sales_excel_file)*100 ,2 ) as per_of_sales from pizza_sales_excel_file
group by pizza_size;



/*---- Total Pizza Sold by Pizza Category:----*/

select pizza_category, sum(quantity) as total_pizza_sold from pizza_sales_excel_file 
group by pizza_category 
order by  sum(quantity) asc;
;

/*----- Top 5 Best Sellers by Revenue, Total Quantity and Total Orders:----*/
select distinct(pizza_name), quantity*total_price as revenue from pizza_sales_excel_file 
order by revenue desc limit 5   ;

select distinct(pizza_name), sum(quantity) from pizza_sales_excel_file  
group by pizza_name 
order by sum(quantity) desc limit 5; 

select pizza_name, count(distinct order_id)as total_order from pizza_sales_excel_file 
group by pizza_name 
order by sum(order_id)desc limit 5 ;



/*----- Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders: -----*/
select distinct(pizza_name), quantity*total_price as revenue from pizza_sales_excel_file 
order by revenue asc limit 5   ;

select distinct(pizza_name), sum(quantity) from pizza_sales_excel_file  
group by pizza_name 
order by sum(quantity) asc limit 5; 

select pizza_name, count(distinct order_id)as total_order from pizza_sales_excel_file 
group by pizza_name 
order by sum(order_id)asc limit 5 ;
