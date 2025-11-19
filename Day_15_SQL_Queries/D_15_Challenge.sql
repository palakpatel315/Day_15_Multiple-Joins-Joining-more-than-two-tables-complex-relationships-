-- Day_15_Challenge_Question: Create a comprehensive service analysis report for week 20 showing: service name, 
-- total patients admitted that week, total patients refused, average patient satisfaction, count of staff assigned to service, 
-- and count of staff present that week. Order by patients admitted descending.

SELECT 
    sw.service,
    MAX(sw.patients_admitted) AS Total_Patients_Admitted,
    MAX(sw.patients_refused) AS Total_Patients_Refused,
    ROUND(MAX(sw.patient_satisfaction), 2) AS Avg_Satisfaction,
    COUNT(DISTINCT s.staff_id) AS Total_Staff_Assigned,
    SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) AS Staff_Present_Week_20
FROM services_weekly sw
LEFT JOIN staff s 
    ON sw.service = s.service
LEFT JOIN staff_schedule ss
    ON s.staff_id = ss.staff_id 
    AND sw.week = ss.week
WHERE sw.week = 20
GROUP BY sw.service
ORDER BY Total_Patients_Admitted DESC;
