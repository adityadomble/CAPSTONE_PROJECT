create database fitness;
use fitness;
select* from fitness;

SELECT COUNT(*) FROM fitness;

-- 1. Show only age, membership_type, and subscription_price.

SELECT member_id,age,membership_type,subscription_price FROM fitness;


-- 2 .Find all members with Premium membership.

SELECT member_id, membership_type FROM fitness
WHERE membership_type ="Premium";


-- 3.List members who visit the gym more than 3 times per week.

SELECT member_id FROM FITNESS
WHERE visit_per_week >="3";


-- 4.Find members who attend group lessons.

SELECT member_id FROM  FITNESS
WHERE  attend_group_lesson  ="TRUE";




-- 5.  Get distinct membership_type values.

SELECT  distinct membership_type FROM FITNESS;



-- 6.Find members who have a drink subscription.


SELECT member_id,AGE FROM fitness
WHERE has_drink_subscription ="TRUE";



-- 7.List members who joined after 2024-01-01.

select member_id,age,join_date FROM FITNESS
WHERE join_date > "2024-01-01";



-- 8.Show members who use the sauna.

SELECT member_id,age,uses_sauna FROM FITNESS
WHERE uses_sauna ="TRUE";


-- 9.Find the average age of gym members.

SELECT AVG(AGE) AS AVG_AGE_GYM FROM FITNESS;



-- 10.Calculate the average duration_in_gym_minutes per membership type.


SELECT membership_type, AVG(duration_in_gym_minutes) AS AVG_DURATION_IN_MIN FROM FITNESS
GROUP BY  membership_type;





-- 11.Count members by membership_type.


SELECT membership_type ,count(*) FROM FITNESS
GROUP BY membership_type;




-- 12.Find the maximum and minimum final_price.

SELECT max(final_price), min(FINAL_PRICE) FROM fitness;



-- 13.how members who have personal training and more than 5 training hours.

SELECT member_id ,personal_training_hours FROM FITNESS
WHERE personal_training_hours > "5";

-- 14.Find total revenue using SUM(final_price).

SELECT SUM(final_price) AS  REVENUE FROM FITNESS; 




-- 15.Display members whose discount_rate > 0.05.

SELECT member_id ,discount_rate FROM FITNESS
WHERE discount_rate >0.05 ;




-- 16.Find the average subscription price for each subscription_model.

SELECT subscription_model,  avg(subscription_price) AS SUBCRIPTION_PRICE FROM FITNESS
GROUP BY subscription_model;





-- 17 List members who have multi_location_access = TRUE.



select member_id, multi_location_access FROM FITNESS
WHERE multi_location_access = "true";




-- 18.Find members who joined in the year 2023.


SELECT member_id FROM fitness
WHERE YEAR(join_date) = 2023;

-- 19.Find the top 5 members who spend the most time in the gym.


SELECT member_id, MAX( duration_in_gym_minutes) AS  MOST_TIME_IN_GYM FROM FITNESS
GROUP BY member_id ,duration_in_gym_minutes
order by MOST_TIME_IN_GYM DESC
LIMIT 5;


-- 20.Rank members by final_price within each membership_type.


SELECT 
   membership_type, MAX(final_price) AS FINAL_PRICE
FROM
    FITNESS
GROUP BY  membership_type

ORDER BY  FINAL_PRICE DESC;


-- 21 .Find members who visit more than average visit_per_week.


SELECT  member_id,avg(visit_per_week) AS AVG_VISIT_PER_WEEK FROM FITNESS
WHERE visit_per_week >2.672
GROUP BY member_id;


use fitness;
-- 22. Calculate the total personal training hours by membership type.


select membership_type,sum(personal_training_hours) as total_personal_training_in_hours from fitness
 group by membership_type;
 
 
 
--  23.find members whose last_visit_date is more than 30 days ago.


select member_id, last_visit_date from fitness
where last_visit_date < current_date()- interval -'30'day;


-- 24.Identify cities (home_gym_location) with more than 10 member




select home_gym_location,count(*) as no_of_members  from fitness
group by  home_gym_location
having count(*) > 10 ;





-- 25.Find members who check in before 10 AM.
 
 




SELECT member_id, avg_time_check_in
FROM fitness
WHERE TIME(avg_time_check_in) < '10:00:00';


select member_id,avg_time_check_in from fitness
where time(avg_time_check_in) < '09:00:00';



-- Calculate discount amount using
-- subscription_price - final_price.


select member_id,membership_type,
subscription_price - final_price FROM FITNESS;




-- Find members with Weekdays only access who visit more than 4 days/week.


SELECT member_id , membership_type,visit_per_week FROM FITNESS
WHERE visit_per_week >"4";



-- 29 Show members who never attended group lessons but have personal training.

SELECT attend_group_lesson ,member_id,personal_training FROM FITNESS
WHERE attend_group_lesson = "FALSE" 
AND 
personal_training ='TRUE';


-- 30  Which membership type generates the highest revenue?


SELECT membership_type,SUM(final_price ) AS REVENUE  FROM FITNESS
GROUP BY  membership_type
ORDER BY REVENUE DESC;



-- 31  Do members with personal training spend more time in the gym?

SELECT personal_training,AVG(duration_in_gym_minutes) AS AVG_DURATION_MIN FROM FITNESS
GROUP BY personal_training;




SELECT membership_type, AVG(duration_in_gym_minutes) AS DURATION  FROM FITNESS
GROUP BY  membership_type;




SELECT  membership_type,count(self_identified_gender ) AS COUNT FROM FITNESS
GROUP BY self_identified_gender,membership_type;



-- Which city has the highest average final_price?

SELECT home_gym_location, AVG(final_price) AS AVG_FINAL_PRICE FROM fitness
GROUP BY home_gym_location
ORDER BY AVG_FINAL_PRICE DESC ;




-- Find churn-risk members (last visit > 60 days).

SELECT member_id,last_visit_date FROM FITNESS 
WHERE last_visit_date < date_sub(curdate(), INTERVAL '60'day);





-- Compare average gym duration for members with vs without drink subscription.

SELECT has_drink_subscription,avg(duration_in_gym_minutes) AS AVG_DURATION FROM FITNESS
GROUP BY has_drink_subscription;
