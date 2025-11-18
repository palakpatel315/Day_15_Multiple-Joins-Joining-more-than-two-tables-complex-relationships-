-- Day_15_P_1. Join patients, staff, and staff_schedule to show patient service and staff availability.

SELECT p.patient_id,
       p.name AS Patient_Name,
       p.service,
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