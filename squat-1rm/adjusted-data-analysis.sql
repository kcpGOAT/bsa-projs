SELECT
	EXTRACT(YEAR FROM date) AS year,
	sex,
	ROUND(AVG(best3squatkg), 2) AS best_squat
	FROM
		open_powerlifting
	WHERE
		sex = 'F' AND 
		age BETWEEN 18 AND 34 AND 
		bodyweightkg BETWEEN 50 AND 90
	GROUP BY
		year, sex
UNION 
SELECT
	EXTRACT(YEAR FROM date) AS year,
	sex,
	ROUND(AVG(best3squatkg), 2) AS best_squat
	FROM
		open_powerlifting
	WHERE
		sex = 'M' AND 
		age BETWEEN 18 AND 34 AND 
		bodyweightkg BETWEEN 90 AND 130
	GROUP BY
		year, sex
	ORDER BY
		year, sex;
