-----------------------
  -- DATA ANALYSIS --
------------------------
-- HARD CATEGORY --
-------------------------


-- Find the top 3 most-viewed tracks for each artist using window functions.
-- Write a query to find tracks where the liveness score is above the average.
-- Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album
-- Find tracks where the energy-to-liveness ratio is greater than 1.2.


-- 1. Find the top 3 most-viewed tracks for each artist using window functions.

	with tab as (
		SELECT artist,track, SUM(views) as total_views,
		DENSE_RANK() OVER (PARTITION BY artist ORDER BY SUM(views) DESC) as RN
		FROM spotify
		GROUP BY 1,2
	)
	select *
	from tab
	where rn <=3 
	ORDER By 1;

-- We dont use group by in top 3 salary in each department
-- but here we have artist artist can have mutiple rows , we need to calculate total of each track thats why we are using group by

-- 2. Write a query to find tracks where the liveness score is above the average.

   select track 
   from spotify
   where liveness >  (
 SELECT AVG(liveness) as avgg
		 FROM spotify
   )


-- 3. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album


  with sp_a as (
	SELECT album , MAX(energy) as max_energy , MIN(energy) as min_energy
	  FROM spotify
	  GROUP BY 1
	  
  )
  select album , max_energy , min_energy, (max_energy -  min_energy) as diff
  from sp_a
  order by 4 desc


-- 4. Find tracks where the energy-to-liveness ratio is greater than 1.2.


with cte as (
SELECT track , energy/liveness as el
FROM spotify
)
   SELECT track , el
   FROM cte
   WHERE 1.2 < el

-- 5. Calculate cumulative likes based on views

SELECT
    track, views,
	SUM(likes) over (ORDER BY views DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)  as Cummulative_likes
FROM spotify;

----------------------
--QUERY OPTIMIZATION--
----------------------


EXPLAIN ANALYZE  
SELECT artist,track,most_played_on
FROM spotify
WHERE artist = 'Gorillaz'
ORDER BY stream
LIMIT 10;
-- Execution Time: 3.163 ms 
-- Planning Time: 0.164 ms

CREATE INDEX artist_index ON spotify (artist);

EXPLAIN ANALYZE  
SELECT artist,track,most_played_on
FROM spotify
WHERE artist = 'Gorillaz'
ORDER BY stream
LIMIT 10;





Select track, sum(stream)  as total_strean
from spotify
group by track
order by 2 desc;