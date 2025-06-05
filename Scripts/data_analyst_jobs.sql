-- Question 1. How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs

-- Answer = 1793

-- Question 2. What company is associated with the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- Answer = "ExxonMobil"

--Question 3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(location) AS tn_postings
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT(location) AS tn_ky_postings
FROM data_analyst_jobs
WHERE location = 'TN'
	OR location = 'KY';

--Q4

SELECT location, COUNT(star_rating) AS star_rating_over_4
FROM data_analyst_jobs
WHERE location = 'TN'
	AND star_rating > 4
GROUP BY location;

--Q5

SELECT COUNT(review_count) AS reviews_between_500_and_1000
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Q6

SELECT location, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY AVG(star_rating) DESC;

-- Answer: Nebraska has the highest avg rating

--Q7

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

-- Answer: 881 distinct job titles

--Q8

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--Answer: 230

--Q9
SELECT company, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC;

--Q11
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

--Answer: 754


