let pg = require('pg');

let client  = new pg.Client({connectionString :'postgresql://postgres:123@localhost:5432/todo'});
client.connect();
console.log('connected');
client.query(`create table todo(id int primary key, text varchar(16) not null, completed boolean)`, 
(err, res)=>{
    console.log('end');
    console.log(err);
    console.log(res);
    client.end();
});
console.log('query')

