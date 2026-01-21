-----------------------
  -- DATA ANALYSIS --
------------------------
-- MEDIUM CATEGORY --
------------------------

-- Calculate the average danceability of tracks in each album.
-- Find the top 5 tracks with the highest energy values.
-- List all tracks along with their views and likes where official_video = TRUE.
-- For each album, calculate the total views of all associated tracks.
-- Retrieve the track names that have been streamed on Spotify more than YouTube.

-- 1. Calculate the average danceability of tracks in each album.
SELECT album , AVG(danceability) as avg_danceability
FROM spotify
GROUP BY album
ORDER BY 2 DESC;

-- 2. Find the top 5 tracks with the highest energy values.
SELECT track , AVG(energy) as energy
FROM spotify
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- 3. List all tracks along with their views and likes where official_video = TRUE.
SELECT track, sum(views) as views, sum(likes) as likes
FROM spotify
WHERE official_video = TRUE
GROUP BY track

-- 4. For each album, calculate the total views of all associated tracks.
SELECT album ,track ,  SUM(views) as views
FROM spotify 
GROUP BY album , track

SELECT album_type, 	SUM(likes) as like, SUM(views) as view , SUM(Stream) as stream
from spotify
group by album_type

-- 5. Retrieve the track names that have been streamed on Spotify more than YouTube.


with cte as (
     SELECT 
      track, 
	  SUM(CASE WHEN most_played_on = 'Spotify' THEN stream ELSE 0 END) as Stream_Spotify , SUM(CASE WHEN most_played_on = 'Youtube' THEN stream ELSE 0 END) as Stream_Youtube
	FROM spotify
	GROUP BY 1
	ORDER By 1
)
select *
from cte 
where Stream_Spotify > Stream_youtube and stream_youtube != 0
order by 2 desc
---------------------

select most_played_on , sum(stream)
from spotify
group by most_played_on

