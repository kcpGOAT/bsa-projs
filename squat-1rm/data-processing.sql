CREATE TABLE openpowerlifting (
	Name VARCHAR(255), 
	Sex VARCHAR(255), 
	Event VARCHAR(255),
	Equipment VARCHAR(255),
	Age NUMERIC,
	AgeClass VARCHAR(255),
	Division VARCHAR(255), 
	BodyweightKg NUMERIC,
	WeightClassKg VARCHAR(255), 
	Squat1Kg NUMERIC, 
	Squat2Kg NUMERIC, 
	Squat3Kg NUMERIC,
	Squat4Kg NUMERIC, 
	Best3SquatKg NUMERIC, 
	Bench1Kg NUMERIC,
	Bench2Kg NUMERIC,
	Bench3Kg NUMERIC,
	Bench4Kg NUMERIC,
	Best3BenchKg NUMERIC,
	Deadlift1Kg NUMERIC,
	Deadlift2Kg NUMERIC,
	Deadlift3Kg NUMERIC,
	Deadlift4Kg NUMERIC,
	Best3DeadliftKg NUMERIC,
	TotalKg NUMERIC,
	Place VARCHAR(255), 
	Wilks NUMERIC, 
	McCulloch NUMERIC, 
	Glossbrenner NUMERIC, 
	IPFPoints NUMERIC, 
	Tested VARCHAR(255), 
	Country VARCHAR(255),
	Federation VARCHAR(255),
	Date DATE, 
	MeetCountry VARCHAR(255), 
	MeetState VARCHAR(255), 
	MeetName VARCHAR(255)
);

COPY openpowerlifting
FROM '/Users/ryanquach/Downloads/openpowerlifting.csv' 
DELIMITER ',' 
CSV HEADER;

ALTER TABLE 
	openpowerlifting 
	RENAME TO 
		open_powerlifting;
