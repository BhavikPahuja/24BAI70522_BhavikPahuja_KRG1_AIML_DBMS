CREATE TABLE Books (
	book_id INT PRIMARY KEY,
	book_name VARCHAR(20) NOT NULL,
	author_name VARCHAR(20) NOT NULL
);

SELECT * 
FROM Books;

ALTER TABLE Books 
ADD COLUMN book_count INT 
CHECK (book_count > 0) 
NOT NULL;

INSERT INTO Books (book_id, book_name, author_name, book_count) 
VALUES (01, 'Harry Potter', 'David', 3);

SELECT * 
FROM Books;

CREATE TABLE Library_Visitors (
	user_id INT PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	age INT CHECK(age >= 17) NOT NULL,
	email VARCHAR(20) NOT NULL UNIQUE
);

SELECT *
FROM Library_Visitors;

INSERT INTO Library_Visitors (user_id, name, age, email)
VALUES (522, 'Bhavik Pahuja', 20, 'bhavik@gmail.com');

INSERT INTO Library_Visitors (user_id, name, age, email)
VALUES (1, 'abc', 21, 'abc@abc.abc');

SELECT *
FROM Library_Visitors;

CREATE TABLE Book_Issue(
	book_issue_id INT PRIMARY KEY,
	user_id INT NOT NULL,
	book_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES Library_Visitors (user_id),
	FOREIGN KEY (book_id) REFERENCES Books (book_id)
);

INSERT INTO Book_Issue (book_issue_id, user_id, book_id)
VALUES (101, 522, 01);

SELECT *
FROM Book_Issue;

ALTER TABLE Book_Issue
ADD COLUMN issue_Date Date;

SELECT *
FROM Book_Issue;

UPDATE Book_Issue
SET issue_date = '2026-01-09'
WHERE book_issue_id = 101;

SELECT *
FROM Book_Issue;

CREATE ROLE Librarian
WITH LOGIN PASSWORD '@Alpha123';

GRANT SELECT, INSERT, DELETE, UPDATE
ON Books
TO Librarian;

GRANT SELECT, INSERT, DELETE, UPDATE
ON Book_Issue
TO Librarian;

REVOKE SELECT, INSERT, DELETE, UPDATE
ON Books, Book_Issue 
FROM Librarian;

