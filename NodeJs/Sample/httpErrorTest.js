let express = require("express");
let httpErrors = require("http-errors");

let fs = require("fs");
let path = require("path"); 

let morgan = require("morgan");

var accessLogStream = fs.createWriteStream(path.join(__dirname, 'access.log'), {flags: 'a'})

morgan("combined",{stream:accessLogStream});


let app = express();

app.use(morgan("tiny"))  // :method :url :status :res[content-length] - :responsetime 
// OR 

let addRequestId = require("express-request-id");
app.use(addRequestId())

app.get("/",(req,res)=>{
    console.log(req.id);
    res.send("HI app");
});

app.get("/error/:no", (req,res, next)=>{
    if(req.params.no) {
        var err = httpErrors(parseInt(req.params.no));
        /**
         * err:objest contain below props
         * .status
         * .statusCode
         * .message
         */

        next(err); // Call default Express error handler
    } else res.send("Hit known error number");
});
app.get("/404", (rq,rs,next) => {
    var err = httpErrors.NotFound(); // predefined method to create 404 status code and message.
    //next(err);
    rs.send("message")
});

app.listen(4200, ()=>{

    console.log("listen port 4200");
})