CREATE DATABASE hr_analytics;



USE hr_analytics;



CREATE TABLE hr1 (EmployeeNumber INT PRIMARY KEY, Age INT,AgeB VARCHAR(50),Attrition VARCHAR(10),
BusinessTravel VARCHAR(50),DailyRate INT,Department VARCHAR(50),DistanceFromHome INT,DFHB VARCHAR(50),
Education INT,EducationField VARCHAR(50),EnvironmentSatisfaction INT,EnvSatisfactionB VARCHAR(50),
Gender VARCHAR(10),HourlyRate INT,JobInvolvement INT,JobInvolvementB VARCHAR(50),JobLevel INT,
JobLevelB VARCHAR(50),JobRole VARCHAR(100),JobSatisfaction INT,JobSatisfactionB VARCHAR(50),MaritalStatus VARCHAR(20));




LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr clean data.csv'
INTO TABLE hr1 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS
(Age, AgeB, Attrition, BusinessTravel, DailyRate, Department,
DistanceFromHome, DFHB, Education, EducationField, EmployeeNumber,
EnvironmentSatisfaction, EnvSatisfactionB, Gender, HourlyRate,
JobInvolvement, JobInvolvementB, JobLevel, JobLevelB, JobRole,
JobSatisfaction, JobSatisfactionB, MaritalStatus);



CREATE TABLE hr2 (Employee_ID INT,MonthlyIncome INT,MonIncB VARCHAR(20),MonthlyRate INT,NumCompaniesWorked INT,
CompWorkedB VARCHAR(20),OverTime VARCHAR(10),PercentSalaryHike INT,`% salary hike` VARCHAR(20),
PerformanceRating INT,PerformanceRatingB VARCHAR(20),RelationshipSatisfaction INT,RelationshipSatisfctnB VARCHAR(20),
StockOptionLevel INT,TotalWorkingYears INT,TotWorkgYrsB VARCHAR(50),TrainingTimesLastYear INT,TrainingtimesLYB VARCHAR(20),
WorkLifeBalance INT,WLBB VARCHAR(20),YearsAtCompany INT,YrsatCompB VARCHAR(20),YearsInCurrentRole INT,YrsinCurrRoleB VARCHAR(20),
YearsSinceLastPromotion INT,PromotionB VARCHAR(20),YearsWithCurrManager INT,YrswitCurrManager VARCHAR(20));



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hr2 clean data.csv'
INTO TABLE hr2 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS
(Employee_ID, MonthlyIncome, MonIncB, MonthlyRate, NumCompaniesWorked,
CompWorkedB, OverTime, PercentSalaryHike, `% salary hike`,
PerformanceRating, PerformanceRatingB, RelationshipSatisfaction,
RelationshipSatisfctnB, StockOptionLevel, TotalWorkingYears,
TotWorkgYrsB, TrainingTimesLastYear, TrainingtimesLYB,
WorkLifeBalance, WLBB, YearsAtCompany, YrsatCompB,
YearsInCurrentRole, YrsinCurrRoleB, YearsSinceLastPromotion,
PromotionB, YearsWithCurrManager, YrswitCurrManager);



SELECT * FROM hr1 h1 JOIN hr2 h2 ON h1.EmployeeNumber = h2.Employee_ID;

select * from hr1;
select * from hr2;

#____________________________________________________________________________________________________
#KPI Cards
SELECT 
COUNT(*) AS Total_Employees,
SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
CONCAT(ROUND(SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2),'%') AS Attrition_Rate,
CONCAT(ROUND(AVG(h2.MonthlyIncome)/1000.0, 2), 'k') AS Avg_Salary_k,
ROUND(AVG(h1.Age), 1) AS Avg_Age,
ROUND(AVG(h2.YearsAtCompany), 1) AS Avg_Tenure,
SUM(CASE WHEN h1.Gender = 'Male' THEN 1 ELSE 0 END) AS Male_Count,
SUM(CASE WHEN h1.Gender = 'Female' THEN 1 ELSE 0 END) AS Female_Count,
ROUND(SUM(CASE WHEN h1.Gender = 'Male' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Male_Percentage,
ROUND(SUM(CASE WHEN h1.Gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Female_Percentage,
ROUND(AVG(h2.WorkLifeBalance), 2) AS Avg_Work_Life_Balance,
COUNT(DISTINCT h1.JobRole) AS Total_Job_Roles,
COUNT(DISTINCT h1.Department) AS Total_Departments
FROM hr1 h1 JOIN hr2 h2 ON h1.EmployeeNumber = h2.Employee_ID;

#_____________________________________________________________________________________

#Dept wise Attrition
SELECT Department,ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Attrition
FROM hr1 GROUP BY Department ORDER BY Attrition DESC;


#Avg Hourly Rate of Male Research Scientist
SELECT AVG(HourlyRate) AS Avg_Hourly_Rate_of_Male_Research_Scientist FROM hr1 WHERE Gender = 'Male' AND JobRole = 'Research Scientist';


#Monthly Income vs Attrition
SELECT h2.MonIncB AS Income_Buckets, COUNT(CASE WHEN h1.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition
FROM hr1 h1 JOIN hr2 h2 ON h1.EmployeeNumber = h2.Employee_ID GROUP BY h2.MonIncB ORDER BY Attrition DESC;


#Job Role vs WorkLifeBalance
SELECT h1.JobRole, h2.WLBB, h2.WorkLifeBalance, COUNT(*) AS EmpCount, CONCAT(ROUND(
SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2),'%') AS Attrition_Rate
FROM hr1 h1 JOIN hr2 h2  ON h1.EmployeeNumber = h2.Employee_ID GROUP BY h1.JobRole, h2.WLBB, h2.WorkLifeBalance 
ORDER BY Attrition_Rate desc;


#Dept wise Avg Working Years
SELECT h1.Department, AVG(h2.TotalWorkingYears) AS Avg_Working_Years FROM hr1 h1 JOIN hr2 h2 
ON h1.EmployeeNumber = h2.Employee_ID GROUP BY h1.Department ORDER BY avg_working_years DESC;


#Promotion vs Attrition
SELECT  h2.PromotionB, COUNT(CASE WHEN h1.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM hr1 h1 JOIN hr2 h2 ON h1.EmployeeNumber = h2.Employee_ID GROUP BY h2.PromotionB ORDER BY attrition_rate DESC;

#____________________________________________________________________________________________________________________________

#Over-time vs Attrition
SELECT h2.OverTime, COUNT(CASE WHEN h1.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM hr1 h1 JOIN hr2 h2 ON h1.EmployeeNumber = h2.Employee_ID GROUP BY h2.OverTime;


#Job Level vs Montly Income
SELECT h1.JobLevelB, concat(round(AVG(h2.MonthlyIncome)/1000.0,2),"k") as Avg_Monthly_Income FROM hr1 h1 JOIN hr2 h2 
ON h1.EmployeeNumber = h2.Employee_ID GROUP BY h1.JobLevelB ORDER BY h1.JobLevelB;


#Top 10 employees with Highest salary by Job Role
SELECT h1.EmployeeNumber, h1.JobRole, h2.MonthlyIncome FROM hr1 h1 JOIN hr2 h2 ON h1.EmployeeNumber = h2.Employee_ID
ORDER BY h2.MonthlyIncome DESC LIMIT 10;


#Job Role vs Avg Salary
SELECT h1.JobRole, concat(round(AVG(h2.MonthlyIncome)/ 1000.0, 2),"k") AS Avg_Salary FROM hr1 h1 JOIN hr2 h2 ON h1.EmployeeNumber = h2.Employee_ID
GROUP BY h1.JobRole order by avg_salary desc;




