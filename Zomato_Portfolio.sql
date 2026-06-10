/*
Cleaning Data
*/


-- Formating Name Column


SELECT *
FROM PortfolioProjects..Zomato_Data

SELECT name, replace(name,'"', '')
FROM PortfolioProjects..Zomato_Data

SELECT name, replace(name,'é', 'ae')
FROM PortfolioProjects..Zomato_Data
WHERE name like '%é%'

UPDATE PortfolioProjects..Zomato_Data
SET name = replace(name,'"', '')
FROM PortfolioProjects..Zomato_Data

UPDATE PortfolioProjects..Zomato_Data
SET name = replace(name,'é', 'ae')
FROM PortfolioProjects..Zomato_Data
WHERE name like '%é%'

UPDATE PortfolioProjects..Zomato_Data
SET name = trim(name)

SELECT name
FROM PortfolioProjects..Zomato_Data

--Checknig OnlineOrder and BookTable Column

SELECT Distinct online_order, book_table 
FROM PortfolioProjects..Zomato_Data

UPDATE PortfolioProjects..Zomato_Data
SET online_order = 'Yes'
WHERE online_order = 'Y'

UPDATE PortfolioProjects..Zomato_Data
SET online_order = 'No'
WHERE online_order = 'N'

SELECT *
FROM PortfolioProjects..Zomato_Data
WHERE rate is null or votes is null or approx_cost_for_two_people is null or listed_in_type is null


---- Remove '/5' from ratings to enable numeric analysis

SELECT DISTINCT(rate)
FROM PortfolioProjects..Zomato_Data

update PortfolioProjects..Zomato_Data
SET rate = replace(rate, '/5','')
FROM PortfolioProjects..Zomato_Data 

SELECT *
FROM PortfolioProjects..Zomato_Data

--Checking votes

SELECT Distinct(votes)
FROM PortfolioProjects..Zomato_Data


--checking approx cost for two people

SELECT Distinct(approx_cost_for_two_people)
FROM PortfolioProjects..Zomato_Data


--Cleaning Listed Type

UPDATE PortfolioProjects..Zomato_Data
SET listed_in_type = REPLACE(listed_in_type, '"', '')

SELECT DISTINCT(listed_in_type)
FROM PortfolioProjects..Zomato_Data


--Checking for duplicate rows
WITH DuplicateCTE as
(
SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY
	name,
	online_order,
	book_table,
	rate,
	votes,
	approx_cost_for_two_people,
	listed_in_type
	ORDER BY name) as rn
FROM PortfolioProjects..Zomato_Data
)
SELECT *
FROM DuplicateCTE
WHERE rn > 1


------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Data Exploration
*/

--Top 10 high rated foods with rates

SELECT TOP 10 name, rate
FROM PortfolioProjects..Zomato_Data
ORDER BY rate desc


--Top 10 Most Voted Foods with votes

SELECT TOP 10 name,votes
FROM PortfolioProjects..Zomato_Data
order by votes desc


--Count of Types

SELECT listed_in_type, count(listed_in_type) CountOfTypes
FROM PortfolioProjects..Zomato_Data
GROUP BY listed_in_type
ORDER BY 2 


--TOP 10 HIGH RATED Restaurants

SELECT TOP 10
		listed_in_type,
		votes,
		rate
FROM PortfolioProjects..Zomato_Data
order by rate DESC, votes DESC


--Average Rating Of Restaurants

SELECT listed_in_type, avg(rate), avg(votes)
FROM PortfolioProjects..Zomato_Data
GROUP BY listed_in_type

--Restaurants Offered Online Order

SELECT listed_in_type
FROM PortfolioProjects..Zomato_Data
WHERE online_order = 'Yes'


--Impact Of Online/Offline Order

SELECT online_order,avg(rate) AvgRate
FROM PortfolioProjects..Zomato_Data
GROUP BY online_order
ORDER BY 1 desc

--Average Cost for two by category

SELECT listed_in_type, avg(approx_cost_for_two_people) AvgCostForTwoPeople
FROM PortfolioProjects..Zomato_Data
GROUP BY listed_in_type
ORDER BY 2 

--Top 10 Most Expensive Restaurants

SELECT Top 10 listed_in_type, approx_cost_for_two_people
FROM PortfolioProjects..Zomato_Data
ORDER BY approx_cost_for_two_people desc

--TOP 10 Most Cheapest Restaurants

SELECT TOP 10 listed_in_type, approx_cost_for_two_people
FROM PortfolioProjects..Zomato_Data
ORDER BY approx_cost_for_two_people 



-- Cost vs Rating Analysis

SELECT
    CASE
        WHEN approx_cost_for_two_people < 300 THEN 'Budget'
        WHEN approx_cost_for_two_people BETWEEN 300 AND 600 THEN 'Mid Range'
        ELSE 'Premium'
    END AS PriceRange,
    ROUND(AVG(CAST(rate AS FLOAT)), 2) AS AvgRating
FROM PortfolioProjects..Zomato_Data
GROUP BY
    CASE
        WHEN approx_cost_for_two_people < 300 THEN 'Budget'
        WHEN approx_cost_for_two_people BETWEEN 300 AND 600 THEN 'Mid Range'
        ELSE 'Premium'
    END
ORDER BY AvgRating DESC;


--Online Ordering vs Ratings

SELECT online_order, ROUND(avg(rate),2) AvgRate
FROM PortfolioProjects..Zomato_Data
GROUP BY online_order
ORDER BY AvgRate DESC


--Table Booking vs Ratings

SELECT book_table, ROUND(avg(rate),2) AvgRate
FROM PortfolioProjects..Zomato_Data
GROUP BY book_table
ORDER BY AvgRate DESC


--Do Expensive Restaurants Receive Better Ratings?

SELECT 






