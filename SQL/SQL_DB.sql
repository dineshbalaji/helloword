-- To Create databace
create database dbname;
-- To update
alter database dbname;
-- to delete
drop databace dbname;

-- crate table;
create table table_name (datatype col1, datatype col2 ...);
-- various datatypes in sql server . i hope can't remmber all data types, we want to refer datatype table

--duplicate existing table (it include data and data_types);
create table table_name as select * from existing_table;

-- duplicate existing table (it create with only data_type not data & not constraint);
create table hello as select * from existing_table where 0=1;



-- ALTER TABLE
-- * add column
alter table table_name add col1 data_type; /* for multiple */ alter table table_name add col1 int, add col2 int;

-- * add constraint 
alter table table_name add co1 set contraint_type;

-- alter data_type
alter table table_name alter column column_name type new_datatype
-- rename column name
alter table table_name rename existing_name to new_name

-- delete column
alter table table_name drop column col1;
-- delete constraint 
alter table table_name col1 drop constraint_type;




/* CONSTRAINT (set of rules for column or table)
FYI : 
* When adding constraint to existing table with existing values then constraint validate with existing values. If value not match it throw error 
* No constraint modify avilable. only drop and recreate

-- Types
1.not null
2.unique
3.primary key 
4.foreign key
*/
-- not null
create table table_name(col1 data_type not null, col2 data_type);


-- unique 
-- FYI: avoid duplicate value, but accept null values *n number of null*;

create table table_name(col1 data_type unique, col2 data_type)

-- primary key (contain unique values & not null values)
create table table_name(col1 data_type primary key, co2 data_type)

-- foreign key (link parent and child table)
create table table_name (col1 int, col2 int reference parent_table_name(parent_col_name));

-- check (run validation before insert or update value to table)
create table table_name (col1 int check(conditions))
-- ex:check price column > 5 or price column < discount column 



--  to name constraints  
create table table_name (col1 data_type, col2 data_type, constraint constraint_name type_constraint(col1,col2));
-- when we create named constraint with multiple field then constraint logic are consist of multiple field
-- EX: unique constraint named with  col1 and col2 then insert accept (1,1) but when do next insert with (1,1) not allowed but it allow (1,2)

-- TODO :
-- find verbose uses in syntax 
-- Check forgin key details in TechonTheNet docs for delete/update parent reference scenarios
-- To be confirm, whatever work on where cluse should work check clue
     




