SELECT
	EXTRACT (YEAR FROM date) AS year,
	ROUND(AVG(best3squatkg), 2) AS best_squat
	FROM
		open_powerlifting
	GROUP BY
		year
	ORDER BY
		year;
