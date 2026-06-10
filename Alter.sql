-- create table 
create table notebook (
  id serial primary key ,
  title varchar(255)
)

-- Rename Table
alter table notebook
rename to notebooks

-- Drop Table
drop table notebooks

-- Add Column
alter table books 
add column publicationDate date;

-- Drop Column
alter table books
drop column rating

-- Rename Column
alter table books
rename column category to categories

-- Change Data Type   
alter table books
alter column price type int using price::int

-- Set Default Value
alter table books
alter column publishedDate set default current_date
/*
 table =>  column => set default 
*/

-- Drop Default Value
alter table books
alter column publishedDate drop default 

-- Set NOT NULL Constraint
alter table books
alter column categories set not null

-- Drop NOT NULL Constraint
alter table books
alter column categories drop not null

-- Add UNIQUE Constraint
alter table books
add constraint title_unique unique (title)

-- Drop UNIQUE Constraint
alter table books
drop constraint title_unique 

-- Add PRIMARY KEY Constraint
alter table books
add constraint id_primary primary key (id)

-- Drop PRIMARY KEY Constraint
alter table books
drop constraint id_primary 