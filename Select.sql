-- Create Books Table

CREATE TABLE books (
    id serial primary key,
    title varchar(100) not null,
    author varchar(100) not null,
    isbn bigint unique,
    category varchar(50),
    price numeric(8,2),
    pages int,
    rating decimal(2,1),
    stock smallint,
    is_available boolean,
    published_date date,
    tags text[],
    metadata jsonb
);

-- Insert Book Records

INSERT INTO books (
    title, author, isbn, category, price, pages, rating, stock, is_available, published_date, tags, metadata
)
VALUES
('Clean Code', 'Robert Martin', 1001, 'Programming', 850.00, 464, 4.8, 10, true, '2008-08-01',
 ARRAY['coding','best-practice'],
 '{"publisher":"Prentice Hall","language":"EN","format":"hardcover"}'),

('The Pragmatic Programmer', 'Andrew Hunt', 1002, 'Programming', 950.00, 352, 4.9, 8, true, '1999-10-20',
 ARRAY['software','development'],
 '{"publisher":"Addison-Wesley","language":"EN","format":"paperback"}'),

('Learning SQL', 'Alan Beaulieu', 1003, 'Database', 700.00, 338, 4.5, 5, true, '2020-04-10',
 ARRAY['sql','database'],
 '{"publisher":"OReilly","language":"EN","format":"paperback"}'),

('PostgreSQL Basics', 'John Smith', 1004, 'Database', 650.00, 280, 4.3, 7, true, '2021-02-01',
 ARRAY['postgresql','backend'],
 '{"publisher":"TechPress","language":"EN","format":"ebook"}'),

('Python Crash Course', 'Eric Matthes', 1005, 'Programming', 900.00, 544, 4.8, 6, true, '2019-05-03',
 ARRAY['python','beginner'],
 '{"publisher":"No Starch","language":"EN","format":"hardcover"}'),

('Data Structures', 'Mark Allen', 1006, 'Computer Science', 750.00, 420, 4.2, 4, false, '2018-01-01',
 ARRAY['algorithms','ds'],
 '{"publisher":"CSBooks","language":"EN","format":"paperback"}'),

('Algorithms', 'Thomas Cormen', 1007, 'Computer Science', 820.00, 240, 4.7, 9, true, '2013-03-01',
 ARRAY['algorithms','complexity'],
 '{"publisher":"MIT Press","language":"EN","format":"hardcover"}'),

('HTML and CSS', 'Jon Duckett', 1008, 'Web', 600.00, 490, 4.6, 12, true, '2011-11-08',
 ARRAY['html','css'],
 '{"publisher":"Wiley","language":"EN","format":"paperback"}'),

('Eloquent JavaScript', 'Marijn Haverbeke', 1009, 'Programming', 780.00, 472, 4.6, 8, true, '2018-12-04',
 ARRAY['javascript','frontend'],
 '{"publisher":"No Starch","language":"EN","format":"ebook"}'),

('React Guide', 'Sarah Green', 1010, 'Web', 880.00, 390, 4.5, 5, true, '2022-01-15',
 ARRAY['react','frontend'],
 '{"publisher":"WebPress","language":"EN","format":"ebook"}'),

('Book 11', 'Author 11', 1011, 'Fiction', 500.00, 200, 4.0, 3, true, '2022-02-01',
 ARRAY['novel'],
 '{"publisher":"ABC","language":"EN","format":"paperback"}'),

('Book 12', 'Author 12', 1012, 'Fiction', 520.00, 220, 4.1, 4, true, '2022-03-01',
 ARRAY['story'],
 '{"publisher":"ABC","language":"EN","format":"paperback"}'),

('Book 13', 'Author 13', 1013, 'History', 530.00, 230, 4.2, 2, false, '2022-04-01',
 ARRAY['history'],
 '{"publisher":"XYZ","language":"EN","format":"hardcover"}'),

('Book 14', 'Author 14', 1014, 'History', 540.00, 240, 4.3, 6, true, '2022-05-01',
 ARRAY['world-history'],
 '{"publisher":"XYZ","language":"EN","format":"paperback"}'),

('Book 15', 'Author 15', 1015, 'Science', 550.00, 250, 4.4, 7, true, '2022-06-01',
 ARRAY['science'],
 '{"publisher":"TechPub","language":"EN","format":"ebook"}'),

('Book 16', 'Author 16', 1016, 'Science', 560.00, 260, 4.5, 8, true, '2022-07-01',
 ARRAY['research'],
 '{"publisher":"TechPub","language":"EN","format":"ebook"}'),

('Book 17', 'Author 17', 1017, 'Math', 570.00, 270, 4.6, 1, false, '2022-08-01',
 ARRAY['math'],
 '{"publisher":"MathWorld","language":"EN","format":"paperback"}'),

('Book 18', 'Author 18', 1018, 'Math', 580.00, 280, 4.7, 9, true, '2022-09-01',
 ARRAY['algebra'],
 '{"publisher":"MathWorld","language":"EN","format":"hardcover"}'),

('Book 19', 'Author 19', 1019, 'Database', 590.00, 290, 4.8, 10, true, '2022-10-01',
 ARRAY['postgresql','sql'],
 '{"publisher":"DBPub","language":"EN","format":"ebook"}'),

('Book 20', 'Author 20', 1020, 'Web', 600.00, 300, 4.9, 11, true, '2022-11-01',
 ARRAY['web','frontend'],
 '{"publisher":"WebPub","language":"EN","format":"ebook"}');


-- Select All Books
select * from books

-- Using Column Alias
select title as "Title of Books", price as "Price of Books"
  from books

-- Sort Books by Price (Descending / Ascending)
select title as "Title of Books", price as "Price of Books" from books
order by price asc 

select title as "Title of Books", price as "Price of Books" from books
order by price desc

-- Select Unique Categories (Distinct)
select distinct category from books


  
-- ** Filtering useing Where clause  with oparetors **
  
-- Filter Using  and Equal (=) Operator
select * from books
where category='Programming'

-- Select Available Books
select * from books
where is_available=true

-- Filter Using OR Operator
select * from books
where category='Programming' or category='Database'

-- Filter Using AND, OR and Comparison Operators
select * from books
where (category='Programming' or category='Database' or category='Fiction') and (rating >4 or price>500)

-- Filter Using BETWEEN Operator
select * from books
where pages between 300 and 400

-- Filter Using IN Operator
select * from books 
where category in ('Programming' , 'Database')

-- Filter from Array
select * from books
where 'coding' = any(tags)

-- Filter from Jsonb
select * from books
where metadata->>'publisher'='TechPub'
