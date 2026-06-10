-- *** Scalar Functions ****

-- Upper Function
select upper(title) as "Titles of Books" from books

-- Lower Function
select lower(title) as "Titles of Books" from books

-- Concat Function
select concat(title , author) as "Title and Authors" from books

-- Length Function
select length(title) as "length of titles" from books


-- **** Aggregate Functions *****

-- Average (AVG) Function
select avg(price) from books

-- Maximum (MAX) Function
select max(price) from books

-- Minimum (MIN) Function
select min(price) from books

-- Sum (SUM) Function
select sum(price) from books

-- Count Function
select count(price) from books

-- Count All Rows
select count(*) from books








