-- CREATE DATABASE
create database library_management_system;
-- create database test;


-- DROP DATABASE
drop database test


-- CREATE TABLE
create table books (
  id serial primary key,
  title varchar(255) not null,
  author varchar(255) not null,
  isbn bigint unique ,
  category varchar(50) not null,
  rating smallint check (rating <= 5),
  price numeric(8,2) check (price > 0), -- full digit will be 8 and after . will be 2 
                                        -- 100000.20 valid  BUT => 10000020.20 Not valid
  isavailable boolean default true,
  tags text[], 
  metadata jsonb
)

-- DELETE TABLE
  drop table books
  

-- INSERT SINGLE RECORD
insert into books(id,title,author,isbn,category,rating,price,tags,metadata)
values (
  1,
  'The Alchemist',
  'Paulo Coelho',
  9780062315007 ,
  'fiction' ,
  5 ,
  26.25 ,
  array['adventure', 'philosophy', 'classic'],
  '{"pages" :208 , "language" : "English"}' -- way to insert  metadata 
  
)


-- INSERT MULTIPLE RECORDS
insert into books(title,author,isbn,category,rating,price,tags,metadata)
values 
  ('1984', 'George Orwell', 9780451524935, 'Dystopian', 5, 12.99, ARRAY['politics', 'classic'], '{"language": "English", "pages": 328}'),
  ('Clean Code', 'Robert C. Martin', 9780132350884, 'Technology', 4, 35.00, ARRAY['programming', 'best practices'], '{"language": "English", "pages": 431}'),
  ('Atomic Habits', 'James Clear', 9780735211292, 'Self-Help', 5, 18.50, ARRAY['productivity', 'psychology'], '{"language": "English", "pages": 320}');


-- INSERT RECORD USING DEFAULT INCREMENT ID
insert into books(id,title,author,isbn,category,rating,price,tags,metadata) 
values (
  default , -- if id is on the insert into then must write default
  'Deep Work',
  'Cal Newport',
  9781455586691,
  'Self-Help',
  4,
  16.00,
  ARRAY['focus', 'productivity'],
  '{"language": "English", "pages": 296}' 
) 


-- VIEW ALL RECORDS
select * from books





