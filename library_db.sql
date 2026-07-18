-- Create Database
CREATE DATABASE library_db;

USE library_db;

-- Admin Table
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);

INSERT INTO admin(username, password)
VALUES ('admin', 'admin123');

-- Books Table
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    category VARCHAR(100),
    quantity INT NOT NULL
);

-- Students Table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    roll_no VARCHAR(20) UNIQUE,
    course VARCHAR(50),
    mobile VARCHAR(15)
);

-- Issue Books Table
CREATE TABLE issue_books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    status VARCHAR(20) DEFAULT 'Issued',
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Sample Books
INSERT INTO books (book_name, author, category, quantity) VALUES
('Python Programming', 'Guido van Rossum', 'Programming', 10),
('Database Management System', 'Korth', 'Database', 5),
('Operating System', 'Galvin', 'Computer', 7);

-- Sample Students
INSERT INTO students (student_name, roll_no, course, mobile) VALUES
('Mohammed Faisal', 'TYBCA001', 'TYBCA', '9876543210'),
('Ali Khan', 'TYBCA002', 'TYBCA', '9988776655');