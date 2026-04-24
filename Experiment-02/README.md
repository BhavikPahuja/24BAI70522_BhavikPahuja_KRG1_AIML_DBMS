# 🧪 Experiment 2: SQL Data Analysis with SELECT Clauses

## 1. Aim of the Session

To perform complex data retrieval and analytical processing using advanced SQL clauses. This experiment focuses on transforming raw organizational data into meaningful summaries using aggregation, grouping, and conditional filtering.

---

## 2. Objectives & Procedure

### Key Objectives

- **Query Lifecycle:** Master the logical execution order of the `SELECT` statement.
- **Conditional Logic:** Differentiate between row-level filtering (`WHERE`) and group-level filtering (`HAVING`).
- **Data Summarization:** Apply aggregate functions—`COUNT()`, `AVG()`, and `SUM()`—to derive business insights.

### Procedure of the Experiment

1.  **Data Modeling:** Create an `EMPLOYEE` table structure with appropriate numerical precisions.
2.  **Seeding:** Populate the table with diverse records representing various departments and salary brackets.
3.  **Categorical Analysis:** Implement `GROUP BY` to segment data by department.
4.  **Metric Evaluation:** Apply `HAVING` to filter out groups that do not meet specific financial thresholds.
5.  **Data Ordering:** Use `ORDER BY` to rank departmental performance.

---

## 3. Practical / Experiment Steps

### Step I: Database Initialization (DDL & DML)

We define the `EMPLOYEE` schema to store human resources data with strict data types and populate it with sample records.

```sql
-- Create Table
CREATE TABLE EMPLOYEE(
    EMP_ID NUMERIC PRIMARY KEY,
    EMP_NAME VARCHAR(20),
    DEPARTMENT VARCHAR(20),
    SALARY NUMERIC(10,2),
    JOINING_DATE DATE
);

-- Populate Table
INSERT INTO EMPLOYEE VALUES
(1, 'Aman', 'IT', 30000, '2023-05-23'),
(2, 'Sam', 'IT', 25000, '2016-05-23'),
(3, 'Neha', 'HR', 18000, '2025-09-19'),
(4, 'Suman', 'Finance', 20000, '2021-11-06'),
(5, 'Rohan', 'Finance', 24500, '2023-10-23'),
(6, 'Aditi', 'HR', 28000, '2018-04-16'),
(7, 'Aanya', 'IT', 26000, '2022-07-07');
```

### Step II: Analytical Query Operations

A. Departmental Average Salary
Calculates the mean salary per department for budget planning.

```sql
SELECT DEPARTMENT, AVG(SALARY)::NUMERIC(10,2) AS AVG_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT;
```

B. High-Earner Identification (Group-Level Filtering)
Filters individual employees who earn above a specific threshold using the HAVING clause.

```sql
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
GROUP BY EMP_ID, EMP_NAME, SALARY
HAVING SALARY > 20000;
```

C. Threshold Analysis for Departments
Displaying departments where the average salary meets a specific criteria (e.g., > 30,000).

```sql
SELECT DEPARTMENT, AVG(SALARY)::NUMERIC(10,2) AS AVG_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 30000;
```

D. Ranked Reporting
Sorts departments from highest to lowest average salary to identify top-paying sectors.

```sql
SELECT DEPARTMENT, AVG(SALARY)::NUMERIC(10,2) AS AVG_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY AVG(SALARY) DESC;
```

![alt text](<Screenshot 2026-01-26 145710.png>)
![alt text](<Screenshot 2026-01-26 145720.png>)
![alt text](<Screenshot 2026-01-26 145747.png>)
![alt text](<Screenshot 2026-01-26 145756.png>)
![alt text](<Screenshot 2026-01-26 145813.png>)
![alt text](<Screenshot 2026-01-26 145827.png>)

### Learning Outcomes

Data Summarization: Gained the ability to condense hundreds of records into concise departmental reports.

Precision Handling: Learned to use type-casting (::NUMERIC) to ensure financial data is formatted professionally.

Execution Logic: Understood that HAVING is processed after GROUP BY, allowing for filters on aggregated results that WHERE cannot handle.

Insight Generation: Developed the skill to rank and organize data for better managerial decision-making.
