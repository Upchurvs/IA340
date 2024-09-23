--Q4.1
/* no, because we still have VA records in other tables */

--Q4.2 
/* no, because there is no fips of 80 */

--Q4.3
/* Yes, you can. However, Chat GPT's interpretation isn't perfect and can be inconsistant based on the prompt given */

--Q4.5
/* Yes, it does recognize the diagram*/

--Q4.6
SELECT n.name, i.year, i.income
FROM income i
JOIN name n ON i.fips = n.fips
WHERE i.year = (SELECT MAX(year) FROM income)
ORDER BY i.income DESC
LIMIT 1;
/* yes it works, the answer was the District of Columbia */

--Q4.7
WITH recent_year_population AS (
    SELECT year, pop
    FROM population
    WHERE fips = '51'  -- Virginia's FIPS code is 51
    ORDER BY year DESC
    LIMIT 1
),
population_5_years_ago AS (
    SELECT year, pop
    FROM population
    WHERE fips = '51'
    ORDER BY year DESC
    OFFSET 4  -- Skips the most recent four years to get the fifth year back
    LIMIT 1
)
SELECT 
    r.pop AS recent_population, 
    p.pop AS population_5_years_ago,
    ((r.pop - p.pop) * 100.0 / p.pop) AS growth_rate_percentage
FROM recent_year_population r
JOIN population_5_years_ago p ON r.year != p.year;
/* my prompt was: calculate VA population growth rate in the past five years. I did not have to edit it to get the result. The growth rate percentage was calculated to be 1.819%*/
 
--Q4.8
/* no, chat GPT is not always correct because it cannot perfectly understand what you are trying to ask of it and often doesn't have all the information on your data.*/
