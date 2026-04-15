CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);
INSERT INTO categories VALUES
(1, 'Science', 'Scientific books'),
(2, 'History', 'History books'),
(3, 'Literature', 'Novels and stories'),
(4, 'Programming', 'Coding books'),
(5, 'Kids', 'Children books');

INSERT INTO categories (category_id, name, description)
VALUES (6, 'Science Fiction', 'Fiction based on futuristic science and space');

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(100),
    publication_year INT,
    availability_status VARCHAR(50),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
INSERT INTO books  VALUES
(1, 'A Brief History of Time', 'Stephen Hawking', 'Science', 1988, 'Available', 1),
(2, 'Guns, Germs, and Steel', 'Jared Diamond', 'History', 1997, 'Available', 2),
(3, 'The Alchemist', 'Paulo Coelho', 'Literature', 1988, 'Available', 3),
(4, 'Clean Code', 'Robert C. Martin', 'Programming', 2008, 'Available', 4),
(5, 'The Very Hungry Caterpillar', 'Eric Carle', 'Kids', 1969, 'Available', 5);


INSERT INTO books VALUES (6, 'Database Fundamentals', 'Unknown Author', 'Programming', 2020, 'Available', 4);

INSERT INTO books (book_id, title, author, genre, publication_year, availability_status, category_id)
VALUES (7, 'SQL for Beginners', 'John Doe', 'Programming', 2021, 'Available', 4);

INSERT INTO books (book_id, title, author, genre, publication_year, availability_status, category_id)
VALUES (8, 'C# Programming', 'David Brown', 'Programming', 2020, 'Available', 4);

INSERT INTO books (book_id, title, author, publication_year, availability_status, category_id)
VALUES (10, 'Dune', 'Frank Herbert', 1965, 'Available', 6);

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(255),
    contact_info VARCHAR(255),
    membership_type VARCHAR(50),
    registration_date DATE
);
INSERT INTO members VALUES
(1, 'Ahmad Ali', '0790000001', 'Student', '2025-01-10'),
(2, 'Sara Mohamed', '0790000002', 'Teacher', '2025-02-12'),
(3, 'Omar Yassin', '0790000003', 'Student', '2025-03-15'),
(4, 'Lina Khaled', '0790000004', 'Visitor', '2025-04-01'),
(5, 'Hassan Noor', '0790000005', 'Student', '2025-05-20');

INSERT INTO members VALUES (6, 'Ali Hassan', '0796666666', 'Student', '2025-01-01');

CREATE TABLE member_books (
    borrowing_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrowing_date DATE,
    due_date DATE,
    return_date DATE NULL,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);




INSERT INTO member_books VALUES
(1, 1, 1, '2026-04-01', '2026-04-10', NULL),
(2, 2, 2, '2026-03-15', '2026-03-25', '2026-03-24'),
(3, 3, 3, '2026-04-05', '2026-04-15', NULL),
(4, 4, 4, '2026-03-20', '2026-03-30', '2026-04-02'),
(5, 5, 5, '2026-04-10', '2026-04-20', NULL);

INSERT INTO member_books (borrowing_id, member_id, book_id, borrowing_date, due_date, return_date)
VALUES (6, 1, 7, '2026-04-10', '2026-04-20', NULL);

INSERT INTO member_books (borrowing_id, member_id, book_id, borrowing_date, due_date, return_date)
VALUES (7, 2, 8, '2026-04-01', '2026-04-10', '2026-04-09');
INSERT INTO member_books (borrowing_id, member_id, book_id, borrowing_date, due_date, return_date)
VALUES 
(8, 1, 1, '2026-01-01', '2026-01-10', '2026-01-09'),
(9, 2, 1, '2026-01-02', '2026-01-12', '2026-01-11'),
(10, 3, 1, '2026-01-03', '2026-01-13', NULL),
(11, 4, 1, '2026-01-04', '2026-01-14', NULL);



INSERT INTO member_books (borrowing_id, member_id, book_id, borrowing_date, due_date, return_date)
VALUES 
(12, 1, 1, '2024-01-02', '2024-01-12', '2024-01-10'),
(13, 2, 2, '2024-01-05', '2024-01-15', NULL),
(14, 3, 3, '2024-01-07', '2024-01-17', '2024-01-16'),
(15, 4, 4, '2024-01-09', '2024-01-19', NULL);

INSERT INTO member_books (borrowing_id, member_id, book_id, borrowing_date, due_date, return_date)
VALUES
(16, 1, 10, '2024-01-05', '2024-01-15', NULL),
(17, 2, 10, '2024-01-06', '2024-01-16', '2024-01-14');


CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    reservation_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
INSERT INTO reservations VALUES
(1, 1, 2, '2026-03-28', 'Pending'),
(2, 2, 3, '2026-03-10', 'Completed'),
(3, 3, 4, '2026-04-03', 'Cancelled'),
(4, 4, 5, '2026-03-15', 'Pending'),
(5, 5, 1, '2026-04-05', 'Completed');




CREATE TABLE financial_fines (
    fine_id INT PRIMARY KEY,
    member_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(50),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);


INSERT INTO financial_fines (fine_id , member_id, amount, payment_status) VALUES
(1, 1, 0.00, 'Pending'),
(2, 2, 0.00, 'NoFine'),
(3, 3, 0.00, 'Pending'),
(4, 4, 3.00, 'Unpaid'),
(5, 5, 0.00, 'Pending');

select* from financial_fines;


CREATE TABLE library_staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(255),
    contact_info VARCHAR(255),
    assigned_section VARCHAR(100),
    employment_date DATE

);
INSERT INTO library_staff VALUES
(1, 'Mohammad Ali', '0791111111', 'Science', '2023-01-01'),
(2, 'Nour Ahmad', '0792222222', 'History', '2023-02-01'),
(3, 'Khaled Omar', '0793333333', 'Programming', '2023-03-01'),
(4, 'Sara Yasin', '0794444444', 'Kids', '2023-04-01'),
(5, 'Lina Hasan', '0795555555', 'Literature', '2023-05-01');


--Retrieve members who registered on a specific date (01-01-2025)

SELECT *
FROM members
WHERE registration_date = '2025-01-01';

--Retrieve all details of the book titled "Database Fundamentals".
SELECT *
FROM books
WHERE title = 'Database Fundamentals';

---Add a new column called Email to the Members table with an appropriate data type

ALTER TABLE members
ADD email VARCHAR(255);
select* from members;

--Insert a new member with the following details:
INSERT INTO members (member_id, name, contact_info, membership_type, registration_date, email)
VALUES (7, 'Omar', '9876543210', 'Student', '2024-06-05', 'Omar@gmail.com');

select* from members;
--Retrieve all members who have made reservations
SELECT DISTINCT m.*
FROM members m
JOIN reservations r ON m.member_id = r.member_id;


---Retrieve members who borrowed the book titled "SQL for Beginners"

SELECT DISTINCT m.*
FROM members m
JOIN member_books mb ON m.member_id = mb.member_id
JOIN books b ON mb.book_id = b.book_id
WHERE b.title ='SQL for Beginners';

--Retrieve members who borrowed and returned the book titled "C# Programming".

SELECT DISTINCT m.*
FROM members m
JOIN member_books mb ON m.member_id = mb.member_id
JOIN books b ON mb.book_id = b.book_id
WHERE b.title = 'C# Programming'

--Find members who returned books after their due date.

SELECT DISTINCT m.*
FROM members m
JOIN member_books mb ON m.member_id = mb.member_id
WHERE mb.return_date IS NOT NULL
AND mb.return_date > mb.due_date;

--Identify books that were borrowed more than 3 times.
SELECT 
    b.book_id,
    b.title,
    COUNT(mb.book_id) AS borrow_count
FROM books b
JOIN member_books mb ON b.book_id = mb.book_id
GROUP BY b.book_id , b.title
HAVING COUNT(mb.book_id) > 3;

--Find members who borrowed books between 01-01-2024 and 10-01-2024--
SELECT DISTINCT m.*
FROM members m
JOIN member_books mb ON m.member_id = mb.member_id
WHERE mb.borrowing_date BETWEEN '2024-01-01' AND '2024-01-10';

---Count the total number of books in the library.

SELECT COUNT(*) AS total_books
FROM books;

----Find members who borrowed books but have not returned them yet.

SELECT DISTINCT m.*
FROM members m
JOIN member_books mb ON m.member_id = mb.member_id
WHERE mb.return_date IS NULL; 

--Find members who borrowed books from the Science Fiction category
SELECT DISTINCT m.*
FROM members m
JOIN member_books mb ON m.member_id = mb.member_id
JOIN books b ON mb.book_id = b.book_id
JOIN categories c ON b.category_id = c.category_id
WHERE c.name = 'Science Fiction';




