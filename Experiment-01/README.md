# 🧪 Experiment 1: Library Management System

**Domain:** Database Management Systems (PostgreSQL)

---

## 1. Aim of the Session

To design, implement, and secure a relational database for a **Library Management System**. The session focuses on the lifecycle of data—from defining structures to enforcing security protocols through Role-Based Access Control (RBAC).

---

## 2. Objectives & Procedure

### Key Objectives

- **Core SQL Operations:** Execute **DDL** (Definition), **DML** (Manipulation), and **DCL** (Control) commands.
- **Data Integrity:** Enforce business rules using `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, and `CHECK` constraints.
- **Security Architecture:** Implement password-protected roles to simulate a professional environment.

### Procedure of the Experiment

1.  **Environment Setup:** Initialize the PostgreSQL server via pgAdmin 4.
2.  **Schema Construction:** Define the relational structure using `CREATE` statements.
3.  **Refinement:** Use `ALTER` commands to simulate real-world schema evolution.
4.  **Population:** Seed the database with valid test data.
5.  **Access Control:** Create a 'Librarian' role and manage granular permissions.

---

## 3. Practical / Experiment Steps

### Step I: Schema Definition (DDL)

We establish the foundational tables with strict relational integrity.

```sql
-- Creating the Book Catalog
CREATE TABLE BOOK_S (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50)
);

-- Creating the Visitor Registry
CREATE TABLE LIBRARY_VISITORS (
    Visitor_ID INT PRIMARY KEY,
    V_Name VARCHAR(50) NOT NULL,
    City VARCHAR(30) CHECK (City IN ('Delhi', 'Mumbai', 'Bangalore', 'Chandigarh'))
);

-- Creating Transaction Logs (Linking Books to Visitors)
CREATE TABLE BOOK_ISSUE (
    Issue_ID SERIAL PRIMARY KEY,
    Book_ID INT REFERENCES BOOK_S(Book_ID),
    Visitor_ID INT REFERENCES LIBRARY_VISITORS(Visitor_ID),
    Issue_Date DATE DEFAULT CURRENT_DATE
);

```

### Step II: Data Population (DML)

```sql
INSERT INTO BOOK_S VALUES (101, 'Harry Potter', 'J.K. Rowling');
INSERT INTO LIBRARY_VISITORS VALUES (501, 'Sumir Malhotra', 'Delhi');
INSERT INTO BOOK_ISSUE (Book_ID, Visitor_ID) VALUES (101, 501);
```

### Step III: Security & Control (DCL)

```sql
-- Creating a restricted role
CREATE ROLE librarian WITH LOGIN PASSWORD 'secure_pass123';

-- Granting specific privileges
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO librarian;

-- Testing revocation
REVOKE UPDATE ON BOOK_S FROM librarian;
```

![alt text](<Screenshot 2026-01-26 143129.png>)
![alt text](<Screenshot 2026-01-26 143139.png>)
![alt text](<Screenshot 2026-01-26 143153.png>)
![alt text](<Screenshot 2026-01-26 143203.png>)
![alt text](<Screenshot 2026-01-26 143212.png>)
![alt text](<Screenshot 2026-01-26 143220.png>)
![alt text](<Screenshot 2026-01-26 143228.png>)
![alt text](<Screenshot 2026-01-26 143240.png>)
![alt text](<Screenshot 2026-01-26 143246.png>)
![alt text](<Screenshot 2026-01-26 143253.png>)
![alt text](<Screenshot 2026-01-26 143258.png>)
![alt text](<Screenshot 2026-01-26 143306.png>)
![alt text](<Screenshot 2026-01-26 143518.png>)
![alt text](<Screenshot 2026-01-26 143524.png>)
![alt text](<Screenshot 2026-01-26 143535.png>)
![alt text](<Screenshot 2026-01-26 143543.png>)
![alt text](<Screenshot 2026-01-26 143645.png>)
![alt text](<Screenshot 2026-01-26 143656.png>)
![alt text](<Screenshot 2026-01-26 143706.png>)

### 6. Learning Outcome

This practical session provided significant insights into:
Structural Logic: Understanding how Foreign Keys and Check Constraints
maintain high data quality and prevent logical errors.

Security Implementation: Learning to manage database security through roles
rather than individual user permissions.

Practical Application: Applying SQL fundamentals to a real-world scenario
(Library Management), demonstrating how relational databases handle
complex interactions between entities. 
