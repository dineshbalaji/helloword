-- To Create databace
create database dbname;
-- To update
alter database dbname;
-- to delete
drop databace dbname;

-- delelte all data in table not but not table
truncate table table_name


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
create table table_name (col1 int, col2 int references parent_table_name(parent_col_name));
-- we can say what action should happen when parent table(refference table) deleted or updated
create table table_name (col1 int, col2 int references parent_table_name(parent_col_name) on delete casecade/set null/set default/no action);

-- casecade - cascade parent table actions
-- set null - if parent data deleted/ update then set null.
-- set default - same like set null but diff here, it set default value


-- check (run validation before insert or update value to table)
-- check like where condtion, it work with 'in', 'between', like...
create table table_name (col1 int check(conditions))
-- ex:check price column > 5 or price column < discount column 




--  to name constraints  
create table table_name (col1 data_type, col2 data_type, constraint constraint_name type_constraint(col1,col2));
-- when we create named constraint with multiple field then constraint logic are consist of multiple field
-- EX: unique constraint named with  col1 and col2 then insert accept (1,1) but when do next insert with (1,1) not allowed but it allow (1,2);

-- create view
create view view_name as 'some sql statement with select operator';
-- update view

replace view view_name as 'sql statement';

-- can be combine both create and view

create or replace view_name as 'sql statement';



-- execute view
select * from view_name;

-- drop view 

drop view view_name;



-- create user 
create user user_name with password 'password';

-- change password
alter user user_name with password 'new_password'

-- rename user

alter user user_name rename to 'new_name';

-- delete user
drop user user_name;

-- get list of user from 'pg_user' table
select * from pg_user;


-- grant priviliege to particular user

grant list_of_priviliege on products to user_name;

-- grant privileges to all user
grant list_of_priviliege on products to public;

/* 
list_of_priviliege
-----------------
select
insert
delete
truncate
update
references
create

-- or --
all
*/

/*
 list of products
 ---------------
 
 table_name,
 view_name
 schema_name
*/
     
-- To revoke privilieges 

revoke list_of_priviliege on products to user_name



