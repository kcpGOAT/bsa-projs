CREATE TABLE first_picks AS
  SELECT * 
    FROM 
      NBA_Full_Draft
    WHERE 
      pick = 1 AND 
      year >= 1976;

CREATE TABLE career_raptor AS
  SELECT 
    name_common, 
    ROUND(AVG("Raptor WAR"), 2) AS avg_raptor
    FROM 
      nba_data_historical_csv
    WHERE 
      G > 10
    GROUP BY 
      name_common;

CREATE TABLE career_bpm_ws AS
  SELECT player, 
    ROUND(AVG("BPM"), 2) AS avg_bpm, 
    ROUND(AVG(ws_48), 2) AS avg_ws_48, 
    ROUND(AVG(per), 2) AS avg_per
    FROM 
      Advanced_csv 
    WHERE 
      G > 10
    GROUP BY 
      player;

CREATE TABLE first_pick_perf AS
  SELECT 
    team, 
    name_common, 
    year, 
    avg_per, 
    avg_raptor, 
    avg_bpm, 
    avg_ws_48 
   FROM 
     first_picks
   INNER JOIN 
     career_raptor ON
       first_picks.Player = career_raptor.name_common
   INNER JOIN 
     career_bpm_ws ON
       career_raptor.name_common = career_bpm_ws.player;

SELECT * FROM first_pick_perf;
