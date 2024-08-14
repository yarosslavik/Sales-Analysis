create table df_orders(
	[order_id] int primary key,
	[order_date] date,
	[ship_mode] varchar(20),
	[segment] varchar(20),
	[country] varchar(20),
	[city] varchar(20),
	[state] varchar(20),
	[postal_code] varchar(20),
	[region] varchar(20),
	[category] varchar(20),
	[sub_category] varchar(20),
	[product_id] varchar(50),
	[quantity] int,
	[discount] decimal(7,2),
	[sale_price] decimal(7,2),
	[profit] decimal(7,2)
)

select 
	*
from df_orders

-- find top 10 highest revenue generating products

select 
	top (10)
	product_id,
	sum(sale_price) total_revenue
from df_orders
group by product_id
order by total_revenue desc

-- top 5 highest selling products in each region 
-- solution with subqueries

select 
	region,
	product_id,
	total_revenue
from 
(select 
	*,
	row_number() over(partition by region order by total_revenue desc) rank_number
from
(select 
	region,
	product_id,
	sum(sale_price) total_revenue
from df_orders
group by region, product_id
) a
) b
where rank_number <= 5

-- top 5 highest selling products in each region 
-- solution with CTE

with sum_by_region_product_id as(
	select 
		region,
		product_id,
		sum(sale_price) total_revenue
	from df_orders
	group by region, product_id
),
sum_with_rank as (
	select 
		*,
		row_number() over(partition by region order by total_revenue desc) rank_number
	from sum_by_region_product_id
)

select 
	*
from sum_with_rank
where rank_number <= 5


-- find month over month growth comparison for 2022 and 2023 sales


with sales_2022 as (select 
	year(order_date) year_2022,
	month(order_date) month_sales,
	sum(sale_price) total_revenue
from df_orders
where year(order_date) = 2022
group by year(order_date), month(order_date)),

sales_2023 as (select 
	year(order_date) year_2023,
	month(order_date) month_sales,
	sum(sale_price) total_revenue
from df_orders
where year(order_date) = 2023
group by year(order_date), month(order_date))

select
	sales_2022.month_sales,
	sales_2022.year_2022,
	sales_2022.total_revenue,
	sales_2023.year_2023,
	sales_2023.total_revenue,
	sales_2023.total_revenue - sales_2022.total_revenue diff_in_revenue
from sales_2022 
inner join sales_2023
on sales_2022.month_sales = sales_2023.month_sales
order by sales_2022.month_sales


-- for each category which month had highest sales


with total_revenue_by_date as
(select 
	category,
	year(order_date) year_sales,
	month(order_date) month_sales,
	sum(sale_price) total_revenue
from df_orders
group by category, year(order_date), month(order_date)
),
total_revenue_with_rank as(
select 
	*,
	row_number() over(partition by category order by total_revenue desc) rank_num
from total_revenue_by_date
)

select 
	category,
	year_sales,
	month_sales,
	total_revenue
from total_revenue_with_rank
where rank_num = 1
order by total_revenue desc

-- which subcategory had the highest growth by profit in 2023 compare to 2022


with total_profit_by_year as (
select 
	sub_category, 
	year(order_date) as order_year,
	sum(sale_price) as sales
from df_orders
group by sub_category, year(order_date)
),
diff_table as (
select 
	sub_category,
	sum(case 
			when order_year = 2022 then sales else 0
		end) as sales_2022,
	sum(case 
			when order_year = 2023 then sales else 0
		end) as sales_2023
from total_profit_by_year
group by sub_category
)
select 
	top (1)
	*,
	format(((sales_2023 - sales_2022)/sales_2022), 'p') growth
from diff_table
order by (sales_2023 - sales_2022)*100/sales_2022 desc