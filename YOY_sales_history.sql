-- select * from sales;
-- Problem Statement:
-- You are given a sales table containing annual performance metrics for multiple regional stores. 
-- Write a SQL query to display a report showing each store's current year sales, the previous year sales, 
-- and the percentage growth or decline compared to the prior year. [3, 4, 5]
with Sales_summary as( select store_id,
sale_year, 
total_sales AS current_year , 
lag(total_sales,1)over(partition by store_id order by sale_year) as previous_year
from sales
)
select 
store_id,
sale_year,
current_year,previous_year,
case 
 when current_year is null then null
 else round (((current_year - previous_year)*100) / previous_year,2)
end as yoy_growth_pct
from Sales_summary


