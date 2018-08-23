var express = require('express');
var router = express.Router();
const {Pool} = require('pg');

const pool = new Pool({connectionString :'postgresql://postgres:123@localhost:5432/todo'});
pool.on('error',(err)=>{
    console.error('unexpected error on idle callback',err);
});

router.put('/', function(req, rs, next) {
    
  pool.connect((err, client, done)=>{
    if (err) throw err;
    //TODO: Make Store Procedure (begin,commit, rollback)
    client.query('insert into todo(text,done) values($1, $2)',[req.body.text|| "", req.body.done || false],(err,res)=>{
        
        if(err) throw err;

        client.query('select * from todo', (err, res)=>{
            done();
            if(err) throw err;
            console.log(res.rows);
            rs.json(res.rows);
        });
    }); 
  });
});

module.exports = router;