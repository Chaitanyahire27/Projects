CREATE DATABASE Healthcare;
USE Healthcare;
select * from data

-- Total appointments per doctor
SELECT doctor, COUNT(*) AS total
FROM data
GROUP BY doctor
ORDER BY total DESC;

--  Patient Count by Diagnosis
SELECT Diagnosis, COUNT(*) AS Patient_Count
FROM data
GROUP BY Diagnosis
ORDER BY Patient_Count DESC;

-- Doctor wise patient count
SELECT Doctor, COUNT(*) AS Patient_Count
FROM data
GROUP BY Doctor
ORDER BY Patient_Count DESC;

-- Most Common Tests
SELECT Test, COUNT(*) AS Test_Count
FROM data
GROUP BY Test
ORDER BY Test_Count DESC;


-- Top 5 billing amount
SELECT Diagnosis, SUM(Billing_Amount) AS Total_Billing
FROM data
GROUP BY Diagnosis
ORDER BY Total_Billing DESC
LIMIT 5;

-- Average Billing per Doctor
SELECT Doctor, ROUND(AVG(Billing_Amount), 2) AS Avg_Billing
FROM data
GROUP BY Doctor
ORDER BY Avg_Billing DESC;

-- Bed Occupancy Utilization
SELECT Bed_Occupancy, COUNT(*) AS Patient_Count
FROM data
GROUP BY Bed_Occupancy
ORDER BY Patient_Count DESC;

-- Percentage of Bill Covered by Insurance (Per Patient)
SELECT 
    Patient_ID,
    Billing_Amount,
    Health_Insurance_Amount,
    ROUND((Health_Insurance_Amount / Billing_Amount) * 100, 2) AS Insurance_Coverage_Percent
FROM data
WHERE Billing_Amount > 0;

-- Most Frequently Used Beds (Bed Utilization)
SELECT Bed_Occupancy, COUNT(*) AS Occupied
FROM data
GROUP BY Bed_Occupancy
ORDER BY occupied DESC;






