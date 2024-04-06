🔍 Project Overview:
AtliQ Mart, a leading retail giant in southern India, embarked on a journey to analyze the performance of their promotional campaigns during Diwali 2023 and Sankranti 2024. With over 50 stores participating in these massive promotions, the goal was to understand which strategies worked best and where improvements could be made for future endeavors.

💡 Insights Unveiled:

🏙️ City and Store Engagement:
➡ Top Three Cities with Incremental Revenue:
1.Bengaluru - 27 million
2.Chennai - 22 million
3.Hyderabad - 16 million
➡ Top Three Cities with % Incremental Revenue:
1.Madurai - 89%
2.Bengaluru - 83%
3.Chennai - 83%
➡ Top Two Stores in terms of Incremental Revenue:
1. "STMYS-1" Mysuru - 3729K IR
2. "STCHE-4" Chennai - 3623K IR

🎉 Campaign and Promotion Schemes Analysis:
▫ Overall Incremental Revenue Increase: 78% (110 million)
▫ Incremental Sold Units Increase: 108% (226K)
▫ Diwali Campaign Incremental Revenue Increase: 96% (79 million)
▫ Sankranti Campaign Incremental Revenue Increase: 54% (31 million)

➡ Top Two Promotion Schemes in terms of Incremental Revenue:
1. 500 Cashback - 91 Million
2. BOGOF(Buy One Get One Free) - 22 Million

➡ Bottom Two Promotion Schemes in terms of Incremental Revenue:
1. 25% OFF - (minus) 3 million
2. 50% OFF - (minus) 1 million

📦 Product Category and Performance:
➡ Top Three Products Category in terms of Incremental Revenue:
1. "Combo1" - 136% of Incremental Revenue
2. "Home Appliances" - 83% of Incremental Revenue
3. "Home Care" - 79% of Incremental Revenue

📈 Understanding Incremental Revenue:
Incremental Revenue measures the additional income generated from promotional activities compared to the revenue without promotions. It reflects the effectiveness of marketing campaigns in driving sales and overall business growth. For example, if the revenue before promotion is 100 and after promotion is 150, the Incremental Revenue would be 50, indicating a 50% increase.




-------------------------------------------------------------------------------------------------------------------------------------------------------------------


problem Statement


AtliQ Mart, a leading retail giant in southern India, embarked on a journey to analyze the performance of their promotional campaigns during Diwali 2023 and Sankranti 2024.
With over 50 stores participating in these massive promotions, the goal was to understand which strategies worked best and where improvements could be made for future endeavors.


Meta Information

This file contains all the meta information regarding the columns described in the CSV files.I have provided 4 CSV files:
1. dim_campaigns
2. dim_products
3. dim_stores
4. fact_events


Column Description for dim_campaigns:
- campaign_id: Unique identifier for each promotional campaign.
- campaign_name: Descriptive name of the campaign (e.g., Diwali, Sankranti).
- start_date: The date on which the campaign begins, formatted as DD-MM-YYYY.
- end_date: The date on which the campaign ends, formatted as DD-MM-YYYY.


*******************************************


Column Description for dim_products:
- product_code: Unique code assigned to each product for identification.
- product_name: The full name of the product, including brand and specifics (e.g., quantity, size).
- category: The classification of the product into broader categories such as Grocery & Staples, Home Care, Personal Care, Home Appliances, etc.


*******************************************



Column Description for dim_stores:
- store_id: Unique code identifying each store location.
- city: The city where the store is located, indicating the geographical market.


*******************************************



Column Description for fact_events:
event_id: Unique identifier for each sales event.
store_id: Refers to the store where the event took place, linked to the dim_stores table.
campaign_id: Indicates the campaign under which the event was recorded, linked to the dim_campaigns table.
product_code: The code of the product involved in the sales event, linked to the dim_products table.
base_price: The standard price of the product before any promotional discount.
promo_type: The type of promotion applied (e.g., percentage discount, BOGOF(Buy One Get One Free), cashback).
quantity_sold(before_promo): The number of units sold in the week immediately preceding the start of the campaign, serving as a baseline for comparison with promotional sales.
quantity_sold(after_promo): The quantity of the product sold after the promotion was applied.


*******************************************



Note: The database named `retail_events_db` includes all the tables mentioned above. This is useful while writing SQL queries to find answers to business questions.
