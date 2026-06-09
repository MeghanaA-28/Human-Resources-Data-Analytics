# 👥 HR Analytics — End-to-End Data Analysis Project

> ⚠️ **Copyright Notice:** This project is shared **solely for learning and inspiration purposes**. You may study and recreate it as part of your own learning journey, but **copying, redistributing, publishing, or presenting this work as your own — in any form — is strictly prohibited.** Respect the effort. Build your own. 🙏



 📌 Project Overview

This is a **complete, end-to-end HR Analytics project** built from raw data to professional dashboards — covering the full data analyst workflow:

```
Raw Data  →  Data Cleaning  →  SQL Analysis  →  Excel  →  Power BI  →  Tableau  →  Presentation
```

The goal? **Understand what drives employee attrition** — and help organizations make smarter, data-backed HR decisions.

---

🗂️ Project Files

| File | Tool | Description |
|------|------|-------------|
| `HR_1.xlsx` / `HR_2.xlsx` | Excel | Raw source datasets |
| `Hr_clean_data.xlsx` | Excel | Cleaned & transformed data |
| `HR_Excel.xlsx` | Excel | Excel-based analysis & charts |
| `HrAnalytics.sql` | MySQL | Database creation, loading & KPI queries |
| `Hr_PowerBi.pbix` | Power BI | Interactive Power BI dashboard |
| `HrTableau.twbx` | Tableau | Interactive Tableau dashboard |
| `HR_Analytics_Presentation.pptx` | PowerPoint | Final stakeholder presentation |

---

## 📊 Dataset Highlights

The dataset covers **two linked HR tables** with rich employee attributes:

**Table 1 — Employee Profile**
- 👤 Demographics: Age, Gender, Marital Status
- 🏢 Work Info: Department, Job Role, Job Level
- 📚 Education: Field, Level
- 😊 Satisfaction: Job, Environment, Involvement
- ✈️ Travel: Business Travel frequency, Distance from Home

**Table 2 — Work & Compensation**
- 💰 Income: Monthly Income, Hourly Rate, Daily Rate, Salary Hike %
- ⏱️ Experience: Total Working Years, Years at Company, Years in Current Role
- 📈 Growth: Promotions, Training, Stock Options
- ⚖️ Balance: Work-Life Balance, Overtime, Relationship Satisfaction, Performance Rating

---

## 🔍 Key Analytical Questions Answered

✅ What is the overall **attrition rate** and how does it vary by department?  
✅ Which **income brackets** see the highest employee exits?  
✅ How does **overtime** impact attrition?  
✅ What's the relationship between **promotion history** and attrition?  
✅ How do **job role** and **work-life balance** interact?  
✅ What is the **average salary** by job level and role?  
✅ Who are the **top 10 highest-paid employees** and what roles do they hold?  
✅ What is the **average tenure** across departments?

---

## 🧮 SQL — KPI Metrics (Sample)

```sql
-- Master KPI Card Query
SELECT 
    COUNT(*) AS Total_Employees,
    CONCAT(ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2), '%') AS Attrition_Rate,
    CONCAT(ROUND(AVG(MonthlyIncome) / 1000.0, 2), 'k') AS Avg_Salary_k,
    ROUND(AVG(Age), 1) AS Avg_Age,
    ROUND(AVG(YearsAtCompany), 1) AS Avg_Tenure
FROM hr1 h1 JOIN hr2 h2 ON h1.EmployeeNumber = h2.Employee_ID;
```

> 📂 Full SQL file with 10+ analytical queries → [`HrAnalytics.sql`](./HrAnalytics.sql)

---

## 🛠️ Tools & Skills Demonstrated

| Skill | Details |
|-------|---------|
| 🧹 **Data Cleaning** | Bucketing, null handling, standardization in Excel |
| 🗄️ **SQL (MySQL)** | DDL, DML, JOINs, CASE statements, GROUP BY, aggregations |
| 📊 **Excel** | Pivot tables, charts, conditional formatting, KPI layout |
| 📈 **Power BI** | Data modelling, DAX measures, interactive visuals, slicers |
| 🔵 **Tableau** | Calculated fields, dashboard design, filters, story points |
| 🎯 **Storytelling** | Insights translated into a business-ready PowerPoint deck |

**EXCEL DASHBOARD**
<img width="932" height="352" alt="image" src="https://github.com/user-attachments/assets/853e85b5-97de-4553-9a3c-e1550ac72333" />

**POWERBI DASHBOARD**
<img width="673" height="376" alt="image" src="https://github.com/user-attachments/assets/75a9e8ca-3853-4ba7-bdfc-2befa353b672" />
<img width="670" height="379" alt="image" src="https://github.com/user-attachments/assets/a69bfca0-5266-432d-b910-475b815004e2" />
<img width="671" height="380" alt="image" src="https://github.com/user-attachments/assets/f5a45e03-3bde-4259-9b73-2895e48a3d65" />

**TABLEAU DASHBAORD**
<img width="832" height="407" alt="image" src="https://github.com/user-attachments/assets/275ecb87-a8e7-41fc-9253-59dc6bde5c6e" />
<img width="833" height="409" alt="image" src="https://github.com/user-attachments/assets/1c013edf-8fda-4108-b827-ebedee977a13" />

---

## 💡 Key Insights 

- 🔴 Employees who **work overtime** show significantly higher attrition rates
- 💸 Those in the **lowest income bracket** are most likely to leave
- 🕐 Employees with **no recent promotions** are at high attrition risk
- 🏢 **Sales** and **R&D** departments face the highest turnover
- ⚖️ Poor **work-life balance** correlates strongly with attrition across most job roles

---

## 🚀 How to Explore This Project

1. **Start with the data** → `HR_1.xlsx` and `HR_2.xlsx` (raw) → `Hr_clean_data.xlsx` (cleaned)
2. **Run the SQL** → Execute `HrAnalytics.sql` in MySQL Workbench to set up the database and explore queries
3. **Open Excel** → `HR_Excel.xlsx` for pivot-based analysis
4. **Launch dashboards** → Open `Hr_PowerBi.pbix` in Power BI Desktop or `HrTableau.twbx` in Tableau
5. **Review the story** → `HR_Analytics_Presentation.pptx` for the final business narrative

---

## 🧑‍💻 About This Project

This project was built as a **portfolio-level, end-to-end data analytics case study** — simulating a real-world scenario where an HR team needs to reduce attrition and improve employee satisfaction using data.

Every step — from data wrangling to dashboard design — reflects actual workflows used by data analysts in industry.

---

## ⚠️ Usage & Intellectual Property

```
© All rights reserved.

This project is shared for EDUCATIONAL PURPOSES ONLY.

✅ You MAY:
   - Study the methodology, queries, and design choices
   - Use it as inspiration to build your own HR analytics project
   - Reference it in discussions about data analysis approaches

❌ You MAY NOT:
   - Copy or reproduce this work and present it as your own
   - Submit it to any academic institution or job application
   - Redistribute or publish any part of this project without permission
   - Use it commercially in any form

Recreate it. Learn from it. Don't steal it. ✊
```

---


⭐ **If this project helped you learn something new, drop a star!** ⭐  
It means a lot and keeps the motivation going 🚀
