select * from election;
drop table t2;


select * from fact_events;
select * from dim_campaigns;
select * from dim_products;
select * from dim_stores;
-- 1
select distinct product_name from fact_events
join dim_products
on fact_events.product_code=dim_products.product_code
where base_price>500 and promo_type="BOGOF";


-- 2 

select City,count(store_id) as Total_Store from dim_stores
group by city
order by Total_Store desc;


-- 3

select fact_events.campaign_id,campaign_name,
sum((base_price)*(`quantity_sold(before_promo)`))/1000000 as `Total_Revenue(Before_promotion)`,
sum((base_price)*(`quantity_sold(after_promo)`))/1000000 as `Total_Revenue(after_promotion)`
from fact_events
join dim_campaigns
on fact_events.campaign_id=dim_campaigns.campaign_id
group by fact_events.campaign_id,campaign_name;


-- 4
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