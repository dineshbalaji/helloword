// sample File used to explore cookie-parser plugin

let express = require("express");
let app = express();
var cookieParser = require('cookie-parser');
app.use(cookieParser("IAMSecret"))


app.get("/cookie", (rq,rs)=>{

    console.log('Cookies: ', rq.cookies);

    rs.cookie("name","hey dinesh");
    
    /**
     * response.cookie is available on Express API. Cookie-parser, parse client cookie and attached to request header
     * more detail about  response.cookie check https://expressjs.com/en/api.html#res.clearCookie
     */

     rs.cookie("server-read","node js app", {httpOnly:true});
     /**
      * httpOnly - it hide cookie to javascript (document.cookie) but it available to edit using chrome-dev-tool.
      */

     rs.cookie("hidden","don't see me",{signed:true});
     console.log(rq.signedCookies);
     /**
      * signed - Nice feature!  it encrpt cookie data and if user edit cookie data using chrome-dev-tool or JS then 
      * it send false as value instead of original value. 
      */

     
    rs.send(`"Hi cookie, ${JSON.stringify(rq.cookies)}` );
})

app.listen(8080, ()=> {console.log("Express app started on port 8080")})

