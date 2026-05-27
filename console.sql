-- 1
CREATE DATABASE LibraryDB;

-- 2
CREATE SCHEMA library;

-- 3
CREATE TABLE library.Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_year INTEGER CHECK (published_year <= EXTRACT(YEAR FROM CURRENT_DATE)),
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE library.Members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    join_date DATE DEFAULT CURRENT_DATE
);
