-- Day_15_P_2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.

SELECT sw.service,
       sw.week,
       sw.available_beds,
       sw.patients_request,
       sw.patients_admitted,
       sw.patients_refused,
       sw.patient_satisfaction,
       sw.staff_morale,
       sw.event,
       s.staff_id,
       s.staff_name,
       s.role,
       ss.present
FROM services_weekly sw
INNER JOIN staff s
ON sw.service = s.service
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
AND sw.week = ss.week
ORDER BY sw.service, sw.week, s.staff_name;