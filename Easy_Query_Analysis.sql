-----------------------
  -- DATA ANALYSIS --
------------------------
-- EASY CATEGORY --
------------------------

-- Retrieve the names of all tracks that have more than 1 billion streams.
-- List all albums along with their respective artists.
-- Get the total number of comments for tracks where licensed = TRUE.
-- Find all tracks that belong to the album type single.
-- Count the total number of tracks by each artist.

-- 1. Retrieve the names of all tracks that have more than 1 billion streams.
SELECT *
FROM spotify
WHERE Stream > 1000000000;

-- 2. Get the total number of comments for tracks where licensed = TRUE.
SELECT SUM(comments)
FROM spotify
WHERE licensed = TRUE;

-- 3. List all albums along with their respective artists.
SELECT DISTINCT album , artist 
FROM spotify
ORDER BY 1;

-- 4. Find all tracks that belong to the album type single.
SELECT *
FROM spotify
WHERE album_type = 'single';

-- 5. Count the total number of tracks by each artist.
SELECT artist , COUNT(track) as No_of_track
FROM spotify
GROUP BY artist
ORDER BY 2 DESC;




