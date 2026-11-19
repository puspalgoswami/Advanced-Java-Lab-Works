CREATE DATABASE IF NOT EXISTS student_registration_db;
USE student_registration_db;

CREATE TABLE IF NOT EXISTS students (
    enrollment_no VARCHAR(30) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    batch VARCHAR(30) NOT NULL,
    official_email VARCHAR(120) NOT NULL,
    mobile_number VARCHAR(15) NOT NULL,
    dob DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    state VARCHAR(60) NOT NULL,
    city VARCHAR(60) NOT NULL,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS student_login (
    enrollment_no VARCHAR(30) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    FOREIGN KEY (enrollment_no) REFERENCES students(enrollment_no) ON DELETE CASCADE
);
