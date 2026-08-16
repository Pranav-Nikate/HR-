📊 HR Employee Analytics Project
📌 Project Overview

This project is an HR Employee Analytics project created using Excel, MySQL, and Power BI.

The project analyzes employee data to understand workforce demographics, salary, experience, performance, and employee attrition.

The complete project follows a data analytics workflow:

Excel → SQL → Power BI → Business Insights

🎯 Project Objectives

The main objectives of this project are:

Analyze employee data
Clean and prepare raw HR data
Perform data analysis using SQL
Calculate important HR metrics
Identify department and job-role trends
Analyze employee attrition
Analyze salary and experience
Evaluate employee performance
Create an interactive Power BI dashboard
Generate useful business insights
🗂️ Dataset

The dataset contains employee-level information.

Main Columns
Column	Description
Employee ID	Unique employee identifier
Employee Name	Name of employee
Age	Employee age
Gender	Employee gender
Department	Employee department
Job Role	Employee job role
Joining Date	Employee joining date
Experience Years	Years of experience
Salary	Employee salary
Performance Rating	Employee performance rating
Attendance Percentage	Employee attendance
Work Mode	Remote/Office/Hybrid
Location	Employee location
Training Hours	Training completed
Promotion Status	Employee promotion status
Attrition Status	Whether employee left the company
🛠️ Tools & Technologies
📗 Microsoft Excel

Excel was used for:

Initial data inspection
Data cleaning
Removing duplicate records
Handling missing values
Correcting inconsistent data
Checking data types
Preparing the dataset for SQL analysis
🗄️ MySQL

SQL was used to analyze the cleaned employee data.

The analysis included:

SELECT
WHERE
GROUP BY
ORDER BY
HAVING
CASE WHEN
Aggregate functions
JOIN
Subqueries
CTEs
Window functions

SQL was used to answer business questions such as:

What is the total number of employees?
What is the average salary?
Which department has the highest number of employees?
Which department has the highest average salary?
What is the average performance rating?
Which job roles have higher attrition?
What is the attrition rate?
How does salary vary with experience?
Which departments have higher employee turnover?
📊 Microsoft Power BI

Power BI was used to create the final interactive dashboard.

Power BI was used for:

Data modeling
Creating relationships
Creating DAX measures
KPI cards
Charts and graphs
Slicers
Page navigation
Interactive dashboard design
Business insights
🔄 Project Workflow
Raw HR Dataset
      ↓
Excel
Data Cleaning & Preparation
      ↓
MySQL
SQL Analysis & Business Questions
      ↓
Power BI
Data Modeling & Visualization
      ↓
Interactive HR Dashboard
      ↓
Business Insights
🧹 Step 1 – Data Cleaning in Excel

The raw employee dataset was first inspected and cleaned in Excel.

Cleaning activities included:
Checking missing values
Removing duplicate records
Removing unnecessary spaces
Standardizing text values
Checking incorrect values
Formatting dates
Checking numerical columns
Preparing clean data for SQL
🗄️ Step 2 – SQL Analysis

The cleaned dataset was imported into MySQL.

SQL queries were created to perform exploratory and business analysis.

Example Analysis
-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM employees;
-- Average Salary
SELECT ROUND(AVG(Salary), 2) AS Average_Salary
FROM employees;
-- Employees by Department
SELECT Department, COUNT(*) AS Employee_Count
FROM employees
GROUP BY Department
ORDER BY Employee_Count DESC;
-- Average Salary by Department
SELECT Department,
       ROUND(AVG(Salary), 2) AS Average_Salary
FROM employees
GROUP BY Department
ORDER BY Average_Salary DESC;

SQL analysis helped identify important patterns before creating the Power BI dashboard.

📊 Step 3 – Power BI Dashboard

The analyzed employee data was then used in Power BI to create an interactive HR dashboard.

🔹 Page 1 – HR Overview

The overview page provides a summary of the organization's workforce.

KPIs
Total Employees
Average Salary
Average Experience
Average Performance Rating
Attrition Count
Attrition Rate
Visualizations
Employees by Department
Employees by Gender
Salary by Department
Employee Experience
Attrition Overview
🔹 Page 2 – Employee Details

This page provides a deeper analysis of employee characteristics.

It focuses on:

Age
Gender
Department
Job Role
Salary
Experience
Performance
Attendance

Users can use slicers to explore specific employee groups.

🔹 Page 3 – Attrition Analysis

This page focuses on employee attrition.

It analyzes:

Overall attrition
Attrition by department
Attrition by job role
Attrition by gender
Attrition by experience
Attrition patterns

This helps identify areas where employee retention may require attention.

🎛️ Interactive Features

The Power BI dashboard includes interactive slicers and navigation buttons.

Users can filter the dashboard by:

Department
Gender
Job Role
Location
Work Mode
Performance Rating
Attrition Status

Navigation buttons allow users to move between:

Overview → Employee Details → Attrition Analysis

💡 Key Business Insights

The project can help answer important HR questions such as:

Which department has the most employees?
Which department has the highest average salary?
Which job roles have the highest attrition?
What is the overall employee attrition rate?
How does experience affect salary?
Which departments have lower or higher performance?
How is the workforce distributed by gender and age?
Which areas may require better employee retention strategies?
📈 Business Value

The analysis can help HR teams with:

Workforce planning
Employee retention
Salary analysis
Performance management
Department-level analysis
Employee turnover analysis
Data-driven decision-making

The project converts raw employee data into meaningful information that can be easily understood through an interactive dashboard.

📁 Project Files
HR-Employee-Analytics/
│
├── README.md
│
├── Dataset/
│   └── HR_Employee_Data.xlsx
│
├── SQL/
│   └── HR_Employee_Analysis.sql
│
├── PowerBI/
│   └── HR_PROJECT_PBI.pbip
│
└── Dashboard/
    └── HR_Dashboard.png
🧠 Skills Demonstrated
Microsoft Excel
MySQL
SQL
Power BI
Power Query
DAX
Data Cleaning
Data Transformation
Data Analysis
Data Visualization
Dashboard Development
KPI Development
Business Intelligence
HR Analytics
👨‍💻 Author
Pranav Anand Nikate

B.Com Student | Aspiring Data Analyst

Skills:
Excel | SQL | Power BI | Python | Data Analytics

⭐ Conclusion

This project demonstrates an end-to-end Data Analytics workflow using Excel, SQL, and Power BI.

Excel was used for data cleaning and preparation, SQL was used for data analysis and answering business questions, and Power BI was used to create an interactive HR analytics dashboard.

The project demonstrates how raw HR data can be transformed into actionable business insights for better workforce planning, performance management, salary analysis, and employee retention.
