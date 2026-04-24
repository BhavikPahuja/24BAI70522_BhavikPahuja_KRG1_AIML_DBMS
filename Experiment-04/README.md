# Experiment 4: Conditional Control Structures in PL/SQL

**Student Name:** Bhavik Pahuja  
**UID:** 24BAI70522  
**Branch:** CSE - AIML  
**Section/Group:** 24AIT_KRG G1  
**Semester:** 4  
**Date of Performance:** February 4, 2026  
**Subject:** DBMS (24CSH-298)

---

## 1. Aim

To design and implement PL/SQL programs utilizing conditional control statements such as `IF–ELSE`, `ELSIF` ladders, and `CASE` constructs to manage execution flow and analyze decision-making capabilities within procedural blocks.

## 2. Software Requirements

- **Database Management System:** Oracle Database (or PostgreSQL with PL/pgSQL)
- **Administration Tool:** Oracle SQL Developer / Live SQL (or pgAdmin)

## 3. Objectives

- Implement basic binary branching using `IF-ELSE`.
- Utilize `ELSIF` ladders for multi-tier categorical evaluation.
- Apply `CASE` statements for discrete value mapping.
- Master `DBMS_OUTPUT` for real-time logic verification.

---

## 4. Problem Statements

### 4.1. Binary Logic (IF–ELSE)

Write a PL/SQL program to check whether a given number is positive or non-positive.

### 4.2. Grade Evaluation (IF–ELSIF–ELSE)

Write a PL/SQL program to evaluate a student's letter grade based on marks obtained.

### 4.3. Tiered Categorization (ELSIF Ladder)

Write a PL/SQL program to determine performance status (Distinction, First Class, etc.) based on marks.

### 4.4. Discrete Selection (CASE Statement)

Write a PL/SQL program to display the name of the day based on an integer input (1-7).

---

## 5. Practical Procedure

1.  **Environment Setup:** Enabled `SERVEROUTPUT` to capture procedural results in the console.
2.  **Logic Design:** Constructed structured `BEGIN...END;` blocks for each problem statement.
3.  **Variable Initialization:** Assigned test values (e.g., `NUM := -21`, `MARKS := 68`) to simulate various execution paths.
4.  **Syntax Validation:** Ensured correct usage of assignment operators (`:=`) and statement terminators.
5.  **Execution:** Ran each block sequentially using the forward slash (`/`) command.
6.  **Verification:** Compared console output against manual logical expectations.

---

## 6. Implementation (SQL Input)

```sql
SET SERVEROUTPUT ON;

-- 1. IF-ELSE Statement (Number Check)
DECLARE
    NUM NUMBER := -21;
BEGIN
    IF NUM > 0 THEN
        DBMS_OUTPUT.PUT_LINE('RESULT: IT IS A POSITIVE NUMBER');
    ELSE
        DBMS_OUTPUT.PUT_LINE('RESULT: IT IS A NON-POSITIVE NUMBER');
    END IF;
END;
/

-- 2. IF-ELSIF-ELSE Statement (Grading System)
DECLARE
    MARKS NUMBER := 68;
    GRADE VARCHAR2(1);
BEGIN
    IF MARKS >= 90 THEN
        GRADE := 'A';
    ELSIF MARKS >= 80 THEN
        GRADE := 'B';
    ELSIF MARKS >= 70 THEN
        GRADE := 'C';
    ELSIF MARKS >= 60 THEN
        GRADE := 'D';
    ELSE
        GRADE := 'F';
    END IF;

    DBMS_OUTPUT.PUT_LINE('MARKS = ' || MARKS || ', GRADE = ' || GRADE);
END;
/

-- 3. ELSIF Ladder (Performance Status)
DECLARE
    MARKS NUMBER := 58;
    PERFORMANCE VARCHAR2(20);
BEGIN
    IF MARKS >= 75 THEN
        PERFORMANCE := 'DISTINCTION';
    ELSIF MARKS >= 60 THEN
        PERFORMANCE := 'FIRST CLASS';
    ELSIF MARKS >= 50 THEN
        PERFORMANCE := 'SECOND CLASS';
    ELSIF MARKS >= 35 THEN
        PERFORMANCE := 'PASS';
    ELSE
        PERFORMANCE := 'FAIL';
    END IF;

    DBMS_OUTPUT.PUT_LINE('MARKS = ' || MARKS || ' AND PERFORMANCE = ' || PERFORMANCE);
END;
/

-- 4. CASE Statement (Day Mapping)
DECLARE
    DAYNUM NUMBER := 3;
    DAYNAME VARCHAR2(20);
BEGIN
    DAYNAME := CASE DAYNUM
        WHEN 1 THEN 'SUNDAY'
        WHEN 2 THEN 'MONDAY'
        WHEN 3 THEN 'TUESDAY'
        WHEN 4 THEN 'WEDNESDAY'
        WHEN 5 THEN 'THURSDAY'
        WHEN 6 THEN 'FRIDAY'
        WHEN 7 THEN 'SATURDAY'
        ELSE 'INVALID DAY'
    END;

    DBMS_OUTPUT.PUT_LINE('INPUT DAY ' || DAYNUM || ' IS ' || DAYNAME);
END;
/
```

## 7. Output Analysis

![alt text](<Screenshot 2026-02-05 094503.png>) ![alt text](<Screenshot 2026-02-05 094510.png>) ![alt text](<Screenshot 2026-02-05 094517.png>) ![alt text](<Screenshot 2026-02-05 094524.png>)

## 8. Learning Outcomes

Developed proficiency in controlling program flow using Conditional Logic.

Identified the efficiency of the CASE Statement for handling discrete, multiple-choice scenarios over long ELSIF ladders.

Learned to implement threshold-based logic for real-world applications like grading systems.

Mastered block-level programming and output management in a procedural database environment.
