// sample File used to explore cookie-parser plugin

let express = require("express");
let app = express();
var cookieParser = require('cookie-parser');
app.use(cookieParser())


app.get("/cookie", (rq,rs)=>{

    console.log('Cookies: ', rq.cookies);

    rs.cookie("name","hey dinesh"); 
    /**
     * response.cookie is available on Express API. Cookie-parser, parse client cookie and attached to request header
     * more detail about  response.cookie check https://expressjs.com/en/api.html#res.clearCookie
     */

     rs.cookie("server-read","node js app", {httpOnly:true});

    rs.send(`"Hi cookie, ${JSON.stringify(rq.cookies)}` );

    
})

app.listen(8080, ()=> {console.log("Express app started on port 8080")})

