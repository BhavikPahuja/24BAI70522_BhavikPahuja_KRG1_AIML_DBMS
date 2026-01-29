# PL/SQL Fundamentals: Basic Structure & Logic

## 📌 Overview

This repository contains a foundational PL/SQL experiment designed to demonstrate the core components of procedural programming within a database environment. The project covers variable declaration, arithmetic processing, and conditional logic.

---

## 🎯 Objectives

- **Structure:** Understand the `DECLARE` and `BEGIN...END` blocks.
- **Variables:** Initialize and map real-world data to specific data types.
- **Logic:** Implement arithmetic formulas and `IF-ELSE` branching.
- **Output:** Use built-in procedures to display results to the console.

---

## 💻 Software Requirements

| Requirement    | Specification |
| :------------- | :------------ |
| **DBMS**       | PostgreSQL    |
| **Admin Tool** | pgAdmin       |
| **Language**   | PL/pgSQL      |

---

## 🛠️ Implementation Details

### 1. Memory Allocation

In the `DECLARE` section, we initialize variables for `Employee ID`, `Name`, and `Salary`.

### 2. Logic & Calculations

- **HRA Calculation:** Calculated as 40% of the base salary.
  > $HRA = Salary \times 0.40$
- **Tax Evaluation:** A conditional check determines if the salary exceeds **60,000**.

---

## 🚀 Procedure

1.  **Environment Setup:** Connect to the PostgreSQL database via pgAdmin.
2.  **Variable Definition:** Allocate memory for numerical and character data types.
3.  **Data Mapping:** Assign static values (e.g., Name: 'THOMAS') to simulate a single-record environment.
4.  **Procedural Execution:** Initiate the `BEGIN` block to process calculations and conditional checks.
5.  **Verification:** Compare console output against manual calculations to ensure logic accuracy.

---

## 📝 Code Snippet

```sql
DO $$
DECLARE
    -- Declaration Section
    EMP_ID INTEGER := 101;
    EMP_NAME VARCHAR(20) := 'THOMAS';
    EMP_SALARY NUMERIC := 25000;
    HRA NUMERIC;
BEGIN
    -- Arithmetic Processing
    HRA := 0.40 * EMP_SALARY;

    -- Output details
    RAISE NOTICE 'EMPLOYEE ID: %', EMP_ID;
    RAISE NOTICE 'EMPLOYEE NAME: %', EMP_NAME;
    RAISE NOTICE 'SALARY: RS. %', EMP_SALARY;
    RAISE NOTICE 'HOUSE RENT ALLOWANCE: RS. %', HRA;

    -- Conditional Evaluation
    IF EMP_SALARY > 60000 THEN
        RAISE NOTICE 'TAX STATUS: YOU NEED TO PAY TAX';
    ELSE
        RAISE NOTICE 'TAX STATUS: YOU DO NOT HAVE TO PAY TAX';
    END IF;
END $$;
```

## Output

![alt text](Experiment-3_Output.png)

## Learning Outcomes

1. Mastered the fundamental organization of PL/SQL blocks.
2. Gained proficiency in declaring and initializing dynamic data types.
3. Learned to apply arithmetic operations and conditional branching within a database script.
4. Utilized RAISE NOTICE (PostgreSQL) for real-time data debugging and display.
