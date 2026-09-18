
--Calculate each skater's high-danger xG rate and xHDG rate and the league average
with xg_difference as
(select 
    name, 
    round(icetime/60,2) as "TOI (Min)",
    I_F_Goals, 
    I_F_xGoals,
    round(I_F_highDangerxGoals/(icetime/3600.0),2) as xHDg_per60,
    round(avg(I_F_highDangerxGoals/(icetime/3600.0)) over(),2) as avg_xHDg_per60,
    round(I_F_Goals-I_F_xGoals,2) as xg_diff
from 
skaters
where situation='all' and games_played>=20)

--Find tiers and xHDGoals diff
select 
    *,
    round(xHDg_per60-avg_xHDg_per60,2) as xHDg_diff_per_60,
    CASE
        when xg_diff>5.7 then 'Regression Candidate' ---1.5 standard deviations, calculated from the full skater population's xg_diff
        when xg_diff<-5.7 then 'Bounce Back Candidate'
        else 'Sustainable'
    end as performance_tier
from xg_difference
order by xHDg_diff_per_60 desc;


--Get data necessary from database, and calculate goal% for each line/pairing
with lines_stats as
(select 
    name,
    round(icetime/60,2) as "TOI (Min)",
    position,
    goalsfor, 
    goalsAgainst,
    case 
        WHEN COALESCE(goalsfor, 0) + COALESCE(goalsAgainst, 0) = 0 THEN 0.0
        else round(coalesce(goalsfor,0)/coalesce(goalsFor+goalsAgainst,0),2)
    end as goals_percentage,
    xGoalsPercentage
from lines
where icetime>12000)

--Find Tiers, and goal % diff
select 
    *,
    round(goals_percentage-xGoalsPercentage,2) as goal_percentage_diff,
    case 
        when round(goals_percentage-xGoalsPercentage,2)>=.1 then 'Overachieving Line' --- 1.5 standard deviations, calculated from the full skater population's goals_percentage-xGoalsPercentage
        when round(goals_percentage-xGoalsPercentage,2) <=-.1 then 'Underachieving Line' --- 1.5 standard deviations, calculated from the full skater population's goals_percentage-xGoalsPercentage
        else 'Performing as Expected'
    end as tier
from lines_stats
order by goal_percentage_diff;