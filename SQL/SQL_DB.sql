-- To Create databace
create database dbname;
-- To update
alter database dbname;
-- to delete
drop databace dbname;

-- crate table;
create table table_name (datatype col1, datatype col2 ...);

--duplicate existing table (it include data and data_types);
create table table_name as select * from existing_table;
-- duplicate existing table (it create with only data_type not data);
create table hello as select * from existing_table where 0=1;



-- update table
-- add column
alter table table_name add col1 data_type;

-- alter data_type
alter table table_name alter column column_name type new_datatype
-- rename column name
alter table table_name rename existing_name to new_name

-- delte column
alter table table_name drop column col1;



-- various datatypes in sql server . i hope can't remmber all data types, we want to refer datatype table