var express = require("express");
var bodyparser = require("body-parser");
var jsonparser = bodyparser.json();
const router = express.Router();
var BusinessDeal = require("../../models/business/BusinessDeal");

router.post("/save", async (req, res) => {
    let body = req.body;
    let businessdeal = new BusinessDeal.BusinessDeal();
    businessdeal.id = body.data.id;
    businessdeal.businessid = body.data.businessid;
    businessdeal.title = body.data.title;
    businessdeal.startdate = body.data.startdate;
    businessdeal.enddate = body.data.enddate;
    businessdeal.description = body.data.description;
    businessdeal.save().then(result =>{
        let data = 
        {
            "data":{
                "status":"success",
                "data":result
            }
        }
        res.end(JSON.stringify(data));
    },
    err =>{
        let data = {
            "data":{
                "status":"fail"
            }
        };
        res.end(JSON.stringify(data))
    }
    );
});


router.post("/addproduct", async (req, res) => {
    let body = req.body;
    let businessdeal = new BusinessDeal.BusinessDeal();
    businessdeal.id = body.data.dealid;
    businessdeal.addproduct(body.data.productid).then(result =>{
        let data = 
        {
            "data":{
                "status":"success",
                "data":result
            }
        }
        res.end(JSON.stringify(data));
    },
    err =>{
        let data = {
            "data":{
                "status":"fail"
            }
        };
        res.end(JSON.stringify(data))
    }
    );
});


router.post("/removeproduct", async (req, res) => {
    let body = req.body;
    let businessdeal = new BusinessDeal.BusinessDeal();
    businessdeal.id = body.data.dealid;
    businessdeal.removeproduct(body.data.productid).then(result =>{
        let data = 
        {
            "data":{
                "status":"success",
                "data":result
            }
        }
        res.end(JSON.stringify(data));
    },
    err =>{
        let data = {
            "data":{
                "status":"fail"
            }
        };
        res.end(JSON.stringify(data))
    }
    );
});

router.post("/get", async (req, res) => {
    let body = req.body;
    let businessdeal = new BusinessDeal.BusinessDeal();
    businessdeal.id = body.data.id;            
    businessdeal.get().then(deal =>{
        businessdeal.getproducts().then(result =>{
            let data = 
            {
                "data":{
                    "status":"success",
                    "data":{
                        "deal":deal,
                        "products":result
                    }
                }
            }
            res.end(JSON.stringify(data));
        }),
        err =>{
            let data = {
                "data":{
                    "status":"fail"
                }
            };
            res.end(JSON.stringify(data))
        }
    },
    err =>{
        let data = {
            "data":{
                "status":"fail"
            }
        };
        res.end(JSON.stringify(data))
    }
    );

});

router.post("/list", async (req, res) => {
    let body = req.body;
    let businessdeal = new BusinessDeal.BusinessDeal();
    businessdeal.businessid = body.data.businessid;            
    businessdeal.list().then(result =>{
    let data = 
        {
            "data":{
                "status":"success",
                "data":result
            }
        }
        res.end(JSON.stringify(data));
    },
    err =>{
        let data = {
            "data":{
                "status":"fail"
            }
        };
        res.end(JSON.stringify(data))
    }
    );
});

router.post("/delete", async (req, res) => {
    let body = req.body;
    console.log(body);
    let businessdeal = new BusinessDeal.BusinessDeal();
    businessdeal.id = body.data.id;            
    businessdeal.delete().then(result =>{
    let data = 
        {
            "data":{
                "status":"success",
                "data":result
            }
        }
        res.end(JSON.stringify(data));
    },
    err =>{
        let data = {
            "data":{
                "status":"fail"
            }
        };
        res.end(JSON.stringify(data))
    }
    );
});
module.exports = router;