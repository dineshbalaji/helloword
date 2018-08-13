pwd:123
-- SELECT operator --

select * from table_name;
select col1,col2 from table_name;
-- select col1,col2 from (anohter select operation)

-- TO avoid duplicate select operator

select distinct * from table_name;

--  WHERE operator  ---
/* where operator can use with 'update / delete'
*/

select * from table_name where condition;
/*
 = equal
 <> or != not equal
 between
 like 
 
 col1 is null
 col1 is not null
*/

-- select top n record

--- sql server  
select top n from table_name;
--  my sql
select col... from table_name limit n
-- orcale 
select col... from table_name romnum < n;

-- get count ---
select count(*) from table_name;

-- get min & max value not full record
select min(col1) from table_name;
select max(col1) from table_name;
select avg(col1) from table_name;
select sum(col1) from table_name;


--where with bitwise operator --
select * from table_name where condition1 or (condition2 and condition2); 

-- orderby --
-- by default ascending order
select * from table_name order by col1;
-- or
select * from table_name order by asc col1
-- descending 
select * from table_name order by desc col1
-- combine
select * from table_name order by asc col1 desc col2;

-- combine where operator

select * from table_name where condition1 order by col1 asc|desc;

-- insert ---

insert into table_name (col1,col2 ... /* all columns */) values (val1,val2 ...);
insert into table_name values (val1,val2 ... /* all column values and must be a same order */);
insert into table_name col1,col2 values val1,val2 /* other column automatically null values inserted*/


-- update based on condition
-- cloumn labels are not case-senstive 
update table_name set col1=val1 .... where condition1
-- update all record

update table_name set col1=val1


-- delete

delete from table_name where condition


-- like -- 
--  like helper operator '% (0/1/more)' '_ (single charator)'
-- speical SQLSERVER : [charlist] or [!charlist]

select table_name where col1 like 'a_' -- a after one latter
select table_name where col1 like 'a%' -- a after one or more latter
select table_name where col like '[a,b,c]_' -- any char range matched one time 
select table_name where col not like 'a_' -- not started with a after one latter
select table_name where col like 'a%' or col like 'b%';
-- use with multiple combination 'a__' or 'a_b%' or '%b'

-- IN --
select * from table_name where col in (/*multiple value with comma separate*/)

select * from table_name where col in (select col1 from table_name /* values get from anohter table */);

/*
Alias is useful in following case

1. when cloumn name is too big / unreadable
2. To cancat column result with different column name
3. query multiple table result

*/
-- 1.
select col as alias_name from  table_name;
-- 2.
select col1+','+col2 as alias_name from table_name;
-- having issue with cancat(+) when working on numarical values
-- 3. normal way 
select t1.col1, t2.col1 from table_name as t1, table_name as t2;
-- without alias 
select table_name1.col,table_name2.col from table_name1, table_name2;
 
/* 
 Sql JOIN -- used to combine two tables
 1.INNER JOIN
 2.OUTER LEFT JOIN
 3.OUTER RIGHT JOIN
 4.FULL OUTER JOIN
*/
-- 1
select t1.col, t2.col from  table_1 as t1 inner join table_2 as t2 on condition --(and condition2 ... order by col);
-- 2 
select t1.col,t2.col from table_1 as t1 left join table_2 as t2 on condition;
--3
select t1.col, t2.col from table_1 as t1 right join table_2 as t2 on condition;
-- 4
select t1.col, t2.col from table_1 as t1 full outer join table_2 as t2 on condition;

-- self join

select t1.col, t2.col from table_1 t1, table_1 t2 where condition; 

-- UNION 
select col1 from table_1 union select  col2 from table_2

-- Group by --
-- 'Group by' work with aggregate function(count,min,max,avg) to group the result-set
select  count(col1) from table_1 group by col2;

-- Having - where cluse not work with aggregate function so having introduce

select count(col1) from table_1 group by col2 having count(col1)>5;

-- Exists - check table exists 

select col1 from table_1 where exists (select col2 from table_2 where condition)

--  any, all work with (=,<,<=,>,>=,!=)
select col1 from table_1 where col1 = any (select col2 from table_2)
select col1 from table_1 where col1 = all (select col2 from table_2)


-- copy from table and create new one

select * into table_1 from table_2

-- copy from table and insert into new table

insert into new_table select * from table_2

insert into new_table(col1,col2 ...) select col1,col2 ... from table_1;


-- create procedure

create procedure procedure_name 
as
statements 
go;
 
 OR
create procedure procedure_name @col1 varchar(30)
as 
select col1 from table_1 where col1 == @col1
go;

-- To run procedure 

exec procedure_name col1 = "test";
