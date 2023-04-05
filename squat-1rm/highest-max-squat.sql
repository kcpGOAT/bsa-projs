SELECT
	EXTRACT(YEAR FROM date) AS year,
	ROUND(MAX(best3squatkg), 2) AS best_squat
	FROM
		open_powerlifting
	GROUP BY
		year;
