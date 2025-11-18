
# 📘 21 Days SQL Challenge – Day 15  
### **Topic:** Multiple Joins (Joining More Than Two Tables)

---

## 🎯 Objective  
Day 15 focused on understanding how to combine data from **three or more tables** using multiple joins.  
The goal was to build complex, meaningful reports by connecting related data across patients, staff, schedules, and weekly service activity.

---

## 🧠 Key Learnings  

- Learned how SQL processes **joins left to right**, building the result step by step.  
- Understood when to use **INNER JOIN** to keep only matched rows and **LEFT JOIN** to keep all rows from the main table.  
- Learned how to connect multiple tables logically by matching keys (service, staff_id, week).  
- Explored how NULL values appear when data is missing in joined tables.  
- Practiced avoiding duplicate rows using **DISTINCT** or **GROUP BY** when joining one-to-many tables.  
- Built confidence in constructing complete reports that rely on multiple datasets.

---

## 🧩 Daily Challenge  

### **Question:**  
Create a comprehensive **service analysis report for Week 20** showing:

- Service name  
- Total patients admitted  
- Total patients refused  
- Average patient satisfaction  
- Number of staff members assigned to the service  
- Number of staff present during that week  

Order the results by **patients admitted (descending)**.

---

### ✅ **SQL Query Used**

```sql
SELECT sw.service,
       sw.week,
       SUM(sw.patients_admitted) AS Total_Patients_Admitted,
       SUM(sw.patients_refused) AS Total_Patients_Refused,
       ROUND(AVG(sw.patient_satisfaction),2) AS Avg_Patient_Satisfaction,
       COUNT(DISTINCT ss.staff_id) AS Total_Staff_Assigned,
       SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) AS Staff_Present
FROM services_weekly sw
LEFT JOIN staff_schedule ss
ON sw.service = ss.service
AND sw.week = ss.week
WHERE sw.week = 20
GROUP BY  sw.service, sw.week
ORDER BY Total_Patients_Admitted DESC ;
```

## 📸 **SQL Queries**

![Check_SQL Query File](https://github.com/palakpatel315/Day_15_Multiple-Joins-Joining-more-than-two-tables-complex-relationships-/tree/main/Day_15_SQL_Queries
)


---
Thank you [Indian Data Club](https://www.linkedin.com/company/indian-data-club/posts/?feedView=all) for starting this challenge and [DPDzero](https://www.linkedin.com/company/dpdzero/) the title sponsor of this challenge

---

## 👩‍💻 **About Me**
**Palak Patel**  
*Aspiring Data Analyst | Skilled in SQL, Power BI, Excel*  
📍 Passionate about turning data into insights and solving real-world business problems.  

🔗 [Connect with me on LinkedIn](https://www.linkedin.com/in/palak-patel-0711242a0/)

---
