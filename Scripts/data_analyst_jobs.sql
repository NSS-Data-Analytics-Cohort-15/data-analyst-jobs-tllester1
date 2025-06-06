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

-- Answer: 21 postings in TN. 6 in KY. 27 in both.

--Q4 How many postings in Tennessee have a star rating above 4?

SELECT COUNT(star_rating) AS star_rating_over_4
FROM data_analyst_jobs
WHERE location = 'TN'
	AND star_rating > 4;

--Answer: 3

--Q5 How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(review_count) AS reviews_between_500_and_1000
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Answer: 151

--Q6 Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY AVG(star_rating) DESC;

-- Answer: Nebraska has the highest avg rating

--Q7 Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

-- Answer: 881 distinct job titles

--Q8 How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--Answer: 230

--Q9 Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT company, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company

--Answer: 41

--Q10 Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC;

--Answer: General Motors Unilever Microsoft Nike American Express Kaiser Permanente all have a avg star rating of 4.20

--Q11 Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

--Answer: 754

--Q12 How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%'
AND title NOT LIKE '%Analytics%';

--Answer: 26. The position either has analyst and analytics in all lowercase or all caps. Otherwise it says 'Specialist' or 'Developer'.

--BONUS
SELECT domain, COUNT(*) AS old_postings
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY old_postings DESC;

--Answer: Internet and Software (62 listings), Banks and Financial Services (61 listings), and Consulting and Business Services (57 listings) are the top three.



