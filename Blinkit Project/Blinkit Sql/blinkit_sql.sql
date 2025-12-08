use funsoft;



select count(*) from blinkit_grocery_data;

---- 1 Total  unique number of items
select count(distinct  type) from blinkit_grocery_data;



-- 2️⃣Unique outlet_size from blinkit_grocery_data;

 select distinct outlet_size from blinkit_grocery_data;
 
--  3. total Sales 


 SELECT 
    sum(total_sales) as revenue from blinkit_grocery_data;



-- 4.Top 10 items by Total Sales

select type 
from blinkit_grocery_data
ORDER BY "Total Sales" DESC
limit 10;



-- 5️⃣ Count of items by Fat Content

select fat_content, count(*)  from blinkit_grocery_data
group by fat_content 
order by fat_content desc;


-- 6.Total and average sales by outlet type

SELECT 
    outlet_type,
    SUM(total_sales) AS total_sales,
    ROUND(AVG(total_sales), 2) AS avg_sales
FROM
    blinkit_grocery_data
GROUP BY outlet_type
ORDER BY total_sales DESC; 





-- 7.Sales by outlet location type

SELECT 
    outlet_location_type,
    SUM(total_sales) AS outlet_location_type,
    ROUND(AVG(total_sales), 2) AS total_sales
FROM
    blinkit_grocery_data
GROUP BY outlet_location_type
ORDER BY total_sales desc;




-- 7.Average sales by item type

SELECT type,
round(AVG(total_sales),2) AS AVG_SALES
FROM blinkit_grocery_data
group by type
order by AVG_SALES DESC;




-- 8. Count of items by fat content

SELECT fat_content ,count(*) type 
 FROM blinkit_grocery_data
group by  fat_content;






-- 10.Top 10 items with highest sales

select type, item_identifier,total_sales
from blinkit_grocery_data
order by  total_sales desc 
limit 10 ;



 -- 10  Oldest and newest outlet establishment year

SELECT 
    MIN(outlet_establishment_year) AS Oldest_establishment_year,
    MAX(outlet_establishment_year) AS Newest_establishment_year
FROM
    blinkit_grocery_data;





-- 11.Rank outlets by total sales


SELECT 
    outlet_identifier,
    SUM(total_sales) AS total_sales_amount,
    RANK() OVER (ORDER BY SUM(total_sales) DESC) AS sales_rank
FROM blinkit_grocery_data
GROUP BY outlet_identifier;


-- 12.Average total sales by outlet size


SELECT 
    outlet_size, ROUND(AVG(total_sales), 2) AS AVG_SALES
FROM
    blinkit_grocery_data
GROUP BY outlet_size
ORDER BY AVG_SALES DESC;





-- 13.Items with above-average total sales


SELECT 
    type, item_identifier, total_sales
FROM
    blinkit_grocery_data
WHERE
    total_sales > (SELECT 
            AVG(total_sales)
        FROM
            blinkit_grocery_data)
ORDER BY total_sales DESC; 










-- 14.

SELECT 
     Fat Content, COUNT(*) AS Item_Count
FROM
    blinkit_grocery_data
GROUP BY ' fat_content'
ORDER BY Item_Count DESC;








-- 15 Average total sales by outlet size

select outlet_size,round(AVG(total_sales),2) AS avg_sales
 FROM blinkit_grocery_data
 group by outlet_size
 order by avg_sales desc;
 


-- 16.Average rating per item type



SELECT 
    type, ROUND(AVG(rating), 2) AS avg_rating
FROM
    blinkit_grocery_data
GROUP BY type
ORDER BY avg_rating DESC;





-- 17.Total sales contribution by outlet type

SELECT 
    outlet_type,
    ROUND(SUM(total_sales), 2) AS Total_sales,
    ROUND(SUM(total_sales) * 100.0 / (SELECT 
                    SUM(total_sales)
                FROM
                    blinkit_grocery_data),
            2) AS Sales_percentage
FROM
    blinkit_grocery_data
GROUP BY outlet_type
ORDER BY Sales_percentage DESC; 





-- 18.Display total sales for each outlet by joining item and outlet tables

select o.outlet_identifier,o.outlet_type,
sum(i.total_sales) as Total_sales
from type as i 
join  outlet_identifier as o
  On i.item_identifier=o.outlet_identifier
  group by o.outlet_identifier
  order by total_sales desc; 
  













SELECT 
    o.outlet_identifier,
    o.outlet_type,
    SUM(i.total_sales) AS total_sales_amount
FROM type AS t
JOIN outlet AS o
    ON i.outlet_identifier = o.outlet_identifier
GROUP BY o.outlet_identifier, o.outlet_type
ORDER BY total_sales_amount DESC;


















-- 15.

SELECT 
    fat_content,
    sum(total_sales) AS sales
FROM blinkit_grocery_data
GROUP BY fat_content
ORDER BY sales DESC;

