
# Spotify SQL Data Analysis Project

## Overview
This project analyzes a **Spotify dataset** with over 20,000 tracks using SQL to explore:

- Track popularity
- Audio features
- Engagement metrics
- Platform-specific streaming behavior

The goal is to generate actionable insights for **marketing, playlist strategy, and content promotion**.

---

## Dataset Description
The dataset contains a single table: `spotify`

**Key columns:**

- `artist` – Name of the artist  
- `track` – Track name  
- `album` / `album_type` – Album details  
- `danceability, energy, loudness, speechiness, acousticness, instrumentalness, liveness, valence, tempo` – Audio features  
- `duration_min` – Track duration in minutes  
- `views, likes, comments, stream` – Engagement metrics  
- `licensed, official_video` – Boolean indicators  
- `energy_liveness` – Precomputed energy-to-liveness ratio  
- `most_played_on` – Platform where track is most played  

---

## Project Objectives
- Find the **top 3 most-viewed tracks per artist** using window functions  
- Identify tracks with **liveness above average**  
- Calculate the **difference between max and min energy per album**  
- Find tracks with **energy-to-liveness ratio > 1.2**  
- Identify the **top 5 tracks with the highest energy**  
- List tracks with **views and likes for official videos**  
- Calculate **total views per album**  
- Find tracks **streamed more on Spotify than YouTube**  
- **Optimize queries** using indexing for faster execution  

---

## SQL Techniques Used
- Window functions: `DENSE_RANK()`, `SUM()`  
- Common Table Expressions (CTEs)  
- Conditional aggregation with `CASE` statements  
- Ranking and filtering for top-N queries  
- Indexing for query optimization  

---

## Key Insights
- **Top 3 Most-Viewed Tracks per Artist:** Popularity is concentrated among a few tracks; helps guide marketing and playlists  
- **High Liveness Tracks:** Often live recordings; useful for live performance playlists  
- **Energy Variation per Album:** Identifies albums suited for workouts or storytelling  
- **Energy-to-Liveness > 1.2:** High-energy studio tracks ideal for ads and promotions  
- **Cumulative Likes:** Highlights most influential tracks and engagement distribution  
- **Total Views per Album:** Shows albums driven by single hits vs overall performance  
- **Spotify vs YouTube:** Platform-specific performance guides marketing strategy  
- **Query Optimization:** Indexing reduced execution time by over 80%  

---

## How to Run
1. Load the `spotify` dataset into a SQL database (PostgreSQL recommended)  
2. Run queries from `queries.sql` file  
3. Use `EXPLAIN ANALYZE` to check query performance  
4. Apply indexing to optimize large queries  

---

## Tools & Technologies
- SQL (PostgreSQL/MySQL)  
- Window functions, CTEs, conditional aggregation  
- Query optimization techniques  

---

## Author
**Bishal Bista**  
- SQL Data Analyst | Data Analytics Enthusiast  
- GitHub: [your-link-here]
