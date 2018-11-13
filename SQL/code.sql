Learn SQL from Scratch
Andy Kunitz
Capstone Project SQL Queries

1.
select distinct utm_campaign from page_visits;

select distinct utm_source from page_visits;

select  utm_campaign, utm_source from page_visits
group by utm_campaign
order by utm_source;

2.
select distinct page_name from page_visits;

3.
WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT  	pv.utm_campaign,
count (ft.user_id)
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
    group by pv.utm_campaign;

4.
WITH last_touch AS (
    SELECT user_id,
        Max(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT  	pv.utm_campaign,
count (lt.user_id)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    group by pv.utm_campaign;

5.
select count(distinct user_id) from page_visits where page_name = '4 - purchase';

6.
WITH last_touch AS (
    SELECT user_id,
        Max(timestamp) as last_touch_at,
  page_name
    FROM page_visits
    where page_name = '4 - purchase'
  GROUP BY user_id)
SELECT  	
pv.utm_campaign,
lt.page_name ,
count (lt.user_id)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp 
    group by pv.utm_campaign order by pv.utm_campaign, pv.page_name ;

