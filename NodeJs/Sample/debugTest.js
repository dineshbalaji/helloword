/**
 * use cmd to Test :
 * "set DEBUG=*,-express:* & node debugTest.js"
 * By default, Express debug internally to log Express lifecylce. for testing purpose i ignore use "-express".
 * * is wild character to print all module log.  it will display particular log by specifying debug name.
 * ex: DEBUG="Student" it print only student log.  
 */

let express = require("express");
let debug = require("debug");

// Student module
(function () {

    console.log("student")
    let log = debug("Student"); // debug: Student 

    let student = express();

    student.get("/", (rq, rs) => {
        log('student requested');
        rs.send("Study well");
    })
    student.listen(4200, () => {
        log('student listener started');
    })

})();

//Master module
(function () {

    let log = debug("Master");

    let student = express();

    student.get("/", (rq, rs) => {
        log('Master requested');
        rs.send("Teach well");
    })
    student.listen(4300, () => {
        log('student listener started');
    })
})();

// util module : run interval to track with above two request
(function(){
    let log = debug("Looper");

    let loop = () =>{
        log('loop cycle');
    }
    setInterval(loop, 2000)
})();
