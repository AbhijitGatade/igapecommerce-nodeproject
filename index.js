var express = require("express");
var body_parser = require("body-parser");
const jwt = require("jsonwebtoken");

var app = express();

app.use(body_parser.json({limit: '50mb'}));
app.use(body_parser.urlencoded({limit: '50mb', extended: true}));  

app.use(express.json());
app.use(express.static("public"));

app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "*");
    if (req.method == "OPTIONS") {
        res.header("Access-Control-Allow-Methods", "POST, GET, PUT, PATCH, DELETE");
        return res.status(200).json({});
    }
    // if(!req.headers.authorization){
    //     let data = {
    //         data: {
    //             status: "exit",
    //             message:"autherization error"
    //         },
    //     };
    //     res.end(JSON.stringify(data));
    // }
    // else if(req.body.data == undefined)
    // {
    //     let data = {
    //         data: {
    //             status: "exit",
    //             message:"body data error"
    //         },
    //     };
    //     res.end(JSON.stringify(data));
    // }
    // else if(req.path.includes("/gettoken"))
    // {
    //     next();
    // }
    // else{
    //     try{
    //         const authHeader = req.headers.authorization;
    //         const token =  authHeader.split(' ')[1];
    //         console.log(token);
    //         const decoded = jwt.verify(token, 'SECRETKEY');
    //         console.log(decoded);
    //         next();
    //     }catch (err){
    //         let data = {
    //             data: {
    //                 status: "exit",
    //                 message:"authentication error"
    //             },
    //         };
    //         res.end(JSON.stringify(data));
    //     }
    // }

    next();
});

app.get("/",function(req,res){
    res.send("Welcome to iGAP-Ecommerce Store APIs")
    res.end();
});

app.post("/gettoken", (req, res)=>{
    let body = req.body;
    const token = jwt.sign({
        token: body.data.token,
        userid: 1,
    }, 'SECRETKEY',
    { expiresIn: "365d" });
    let data = {
        data: {
            status: "success",
            token: token,
        },
    };
    res.end(JSON.stringify(data));
});

// Shared APIs routing for Beginning
app.use("/shared/state", require("./routes/shared/state"));
app.use("/shared/district", require("./routes/shared/district"));
app.use("/shared/taluka", require("./routes/shared/taluka"));
app.use("/shared/city", require("./routes/shared/city"));
app.use("/shared/pincode", require("./routes/igap/pincode"));
// Shared APIs routing for End

// IGAP APIs routing for Beginning
app.use("/igap/authentication", require("./routes/igap/authentication"))
app.use("/igap/admin", require("./routes/igap/admin"))
app.use("/igap/business", require("./routes/igap/business"));
app.use("/igap/productcategory", require("./routes/igap/igapproductcategory"));
app.use("/igap/vendor", require("./routes/igap/igapvendor"));
app.use("/igap/vendorproduct", require("./routes/igap/igapvendorproduct"));
app.use("/igap/vendorproductpicture" , require("./routes/igap/igapvenderproductpicture"));
app.use("/igap/vendorproductvariety", require("./routes/igap/igapvendorproductvariety"));
// IGAP APIs routing for End

// Business APIs routing for Beginning
app.use("/business/productcategory", require("./routes/business/businessproductcategory"));
app.use("/business/product", require("./routes/business/businessproduct"));
app.use("/business/productpicture" , require("./routes/business/businessproductpicture"));
app.use("/business/productvariety", require("./routes/business/businessproductvariety"));
app.use("/business/productreview", require("./routes/business/businessproductreview"));
app.use("/business/coupon", require("./routes/business/businesscoupon"));
app.use("/business/deal", require("./routes/business/businessdeal"));
app.use("/business/affiliate" , require("./routes/business/businessaffiliate"));
app.use("/business/blogcategory", require("./routes/business/businessblogcategory"));
app.use("/business/blog", require("./routes/business/businessblog"));
app.use("/business/subscription", require("./routes/business/businesssubscription"));
app.use("/business/ad", require("./routes/business/businessad"));
app.use("/business/banner", require("./routes/business/businessbanner"));
// Business APIs routing for End

//User APIS routing start
app.use("/user" , require("./routes/user/user"));
app.use("/user/address" , require("./routes/user/useraddress"));
app.use("/user/order" , require("./routes/user/order"));

app.listen(8081, function() {
    console.log("website is  started");
});

