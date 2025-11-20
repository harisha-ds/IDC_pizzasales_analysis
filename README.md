
## 🍕 IDC Pizza Sales Analysis – SQL Project

#### Project Overview  
This project explores and analyzes sales data from the IDC Pizza database using SQL.  
The goal is to understand customer ordering behavior, identify high-performing pizza categories, and evaluate overall business performance through structured SQL queries.    

The database contains 4 key tables:  
orders – order metadata (date, time)  
order_details – pizzas and quantities ordered  
pizzas – pizza sizes and prices  
pizza_types – pizza names, categories, ingredients  

This project covers everything from basic inspection to detailed analytical insights.

#### Analysis Steps:  
###### Phase 1 → Data Exploration & Cleaning  
Identify unique pizza categories  
Check for missing ingredients  
Validate missing pizza prices  
Inspect daily orders  

###### Phase 2 → Filtering & Exploration  
Orders by date/time  
High-priced pizzas  
Pizza sizes (L, XL) performance  
Mid-price range pizzas  
Chicken-based pizzas  

###### Phase 3 → Sales Insights  
Total pizzas sold  
Average pizza price  
Revenue per order  
Category-wise quantity sold  
Identify pizzas never ordered    
Price variation by pizza size (self-join) 


##### Key Insights:
✅ 1. Total Sales Performance
Total pizzas sold: 49574
Average pizza price: 16.440625


✅ 2. Popular Categories
Highest-selling categories:
Example: Classic, Supreme, Veggie, Chicken 
Some categories contribute more than 5,000+ units sold.

✅ 3. High-Value Orders
Several orders generate significantly higher revenue due to:
Larger pizza sizes
High-priced premium pizzas

✅ 4. Pizzas Never Ordered
A few pizzas in the catalog were never purchased, showing:
Potential for removal OR Need for better promotion

✅ 5. Size-Based Price Gaps
Using a self-join, the project identifies price differences between:
S → M → L → XL size
Larger sizes follow a consistent price increase pattern.

#### 🛠️ Technologies Used :
MySQL  
SQL Joins, Aggregation, Filtering  








































