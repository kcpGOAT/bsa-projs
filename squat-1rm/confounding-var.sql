-- Sex distribution

SELECT
	EXTRACT (YEAR FROM date) AS year,
	ROUND(SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 END)::NUMERIC/COUNT(*), 2) AS prop_female,
	ROUND(SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 END)::NUMERIC/COUNT(*), 2) AS prop_male
	FROM
		open_powerlifting
	GROUP BY
		year
	ORDER BY
		year;
		
-- Age over time

SELECT
	EXTRACT (YEAR FROM date) AS year,
	ROUND(AVG(age), 2) AS mean_age,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) AS median_age
	FROM
		open_powerlifting
	GROUP BY
		year
	ORDER BY
		year;
	
-- Bodyweight over time

SELECT
	EXTRACT (YEAR FROM date) AS year,
	ROUND(AVG(bodyweightkg), 2) AS mean_bw_kg,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY bodyweightkg) AS median_bw_kg
	FROM 
		open_powerlifting
	GROUP BY
		year
	ORDER BY
		year;
		
-- Number of people: sudden surge in 2010 corresponds with drop in average

WITH num_lifters AS (
	SELECT 
		EXTRACT(year FROM date) AS year,
		COUNT(*) AS count
		FROM
			open_powerlifting
		GROUP BY
			year
),

num_lifters_diff AS (
	SELECT
		year,
		count,
		count - LAG(count) OVER(ORDER BY year) AS change_count
		FROM 
			num_lifters
)

SELECT 
	year,
	count,
	change_count,
	ROUND(change_count::NUMERIC/count, 2) AS change_percent
	FROM
		num_lifters_diff
	WHERE 
		year NOT IN (1964, 2019);
