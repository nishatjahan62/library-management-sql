-- Filter Data Using LIKE Operator
select * from books
where title like 'L%L'

-- Filter Data Using LIKE with Fixed Character Length
select * from books
  where author like 'R____________' -- - is character number

-- Filter Data Using ILIKE Operator (Case Insensitive)
select * from books
where title Ilike 'l%l'  -- case Insensitive so will show the ans








