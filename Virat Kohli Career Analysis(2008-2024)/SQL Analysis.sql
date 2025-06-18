CREATE DATABASE VK;
USE VK;
SELECT * FROM book1;
-- Rename table
ALTER TABLE book1
RENAME TO stats;

-- Total Runs in Each Format
SELECT FORMAT, SUM(Runs) AS Total_Runs
FROM stats
GROUP BY FORMAT;

-- Total Innings, Outs, and Balls Faced
SELECT FORMAT, 
       SUM(Innings) AS Total_Innings,
       SUM(Outs) AS Total_Outs,
       SUM(Balls) AS Total_Balls
FROM stats
GROUP BY FORMAT;

-- Total 50s, 100s, 4s, and 6s
SELECT FORMAT,
       SUM("50") AS Total_50s,
       SUM("100") AS Total_100s,
       SUM("4s") AS Total_4s,
       SUM("6s") AS Total_6s
FROM stats
GROUP BY FORMAT;

-- Average Batting Average and Strike Rate per Format
SELECT FORMAT,
       ROUND(AVG(Avg), 2) AS Avg_Batting_Average,
       ROUND(AVG(SR), 2) AS Avg_Strike_Rate
FROM stats
GROUP BY FORMAT;

-- Best Batting Average and Strike Rate (Per Format & Year)
SELECT FORMAT, Year, Avg AS Best_Average
FROM stats
WHERE (FORMAT, Avg) IN (
    SELECT FORMAT, MAX(Avg)
    FROM stats
    GROUP BY FORMAT
);

-- Year-wise Total Runs (All Formats)
SELECT Year, SUM(Runs) AS Total_Runs
FROM stats
GROUP BY Year
ORDER BY Year;

-- Year-wise Runs per Format
SELECT FORMAT, Year, Runs
FROM stats
ORDER BY FORMAT, Year;

-- Best Year by Total Runs
SELECT Year, SUM(Runs) AS Total_Runs
FROM stats
GROUP BY Year
ORDER BY Total_Runs DESC
LIMIT 1;

-- Highest Individual Score per Format
SELECT FORMAT, MAX(HS) AS Highest_Score
FROM stats
GROUP BY FORMAT;

-- Boundary Analysis – Total Boundaries
SELECT FORMAT,
       SUM(`4s`) + SUM(`6s`) AS Total_Boundaries
FROM stats
GROUP BY FORMAT;

-- Total 4's and 6's
SELECT FORMAT,
       SUM(`4s`) AS Total_4s,
       SUM(`6s`) AS Total_6s
FROM stats
GROUP BY FORMAT;




