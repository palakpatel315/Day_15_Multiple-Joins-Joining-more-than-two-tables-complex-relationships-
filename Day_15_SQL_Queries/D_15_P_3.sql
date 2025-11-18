-- Day_15_P_3. Create a multi-table report showing patient admissions with staff information.

SELECT 
    p.patient_id,
    p.name AS Patient_Name,
    p.service,
    p.arrival_date,
    s.staff_id,
    s.staff_name,
    s.role,
    ss.week,
    ss.present
FROM patients p
INNER JOIN staff s
ON p.service = s.service
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
ORDER BY p.service, p.name, s.staff_name;
