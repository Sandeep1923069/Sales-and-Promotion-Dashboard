select * from election;
drop table t2;


select * from fact_events;
select * from dim_campaigns;
select * from dim_products;
select * from dim_stores;
-- Q1 Provide alist of products with a base price greater than 500 and that are featured in promo type of 'BOGOF' (Buy One Get One Free). This information will help us
   identify high-value products that are currently being heavily discounted, which can be useful for evaluating our pricing and promotion strategies.



select distinct product_name from fact_events
join dim_products
on fact_events.product_code=dim_products.product_code
where base_price>500 and promo_type="BOGOF";


-- Q2 Generate a report that provides an overview of the number of stores in each city.The results will be sorted in descending order of store counts, allowing us to
   identify the cities with the highest store presence.The report includes two essential fields: city and store count, which will assist in optimizing our retail
   operations.


select City,count(store_id) as Total_Store from dim_stores
group by city
order by Total_Store desc;


-- Q3 Generate a report that displays each campaign along with the total revenue generated before and after the campaign? The report includes three key fields:
campaign_name, total_revenue(before_promotion), total_revenue(after_promotion). This report should help in evaluating the financial
impact of our promotional campaigns. (Display the values in millions)


select fact_events.campaign_id,campaign_name,
sum((base_price)*(`quantity_sold(before_promo)`))/1000000 as `Total_Revenue(Before_promotion)`,
sum((base_price)*(`quantity_sold(after_promo)`))/1000000 as `Total_Revenue(after_promotion)`
from fact_events
join dim_campaigns
on fact_events.campaign_id=dim_campaigns.campaign_id
group by fact_events.campaign_id,campaign_name;


-- Q4 Produce a report that calculates the Incremental Sold Quantity (ISU%) for each category during the Diwali campaign. Additionally, provide rankings for the
categories based on their ISU%. The report will include three key fields: category, isu%, and rank order. This information will assist in assessing the
category-wise success and impact of the Diwali campaign on incremental sales.

with temp1 as(
with temp as (
select category, 
sum(`quantity_sold(before_promo)`) as `Total_Qty(Before_promotion)`,
sum(`quantity_sold(after_promo)`) as `Total_Qty(after_promotion)`
from fact_events
Join dim_products
on fact_events.product_code=dim_products.product_code
where campaign_id="CAMP_DIW_01"
group by category)
select *,(`Total_Qty(after_promotion)`-`Total_Qty(Before_promotion)`)/`Total_Qty(Before_promotion)`*100 as 'ISU%'
from temp)
select Category,`ISU%`,
dense_rank() over(order by `ISU%` DESC) as Order_rank
 from temp1
