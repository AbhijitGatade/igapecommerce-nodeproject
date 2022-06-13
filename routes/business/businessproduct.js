var express = require("express");
var BusinessProduct = require("../../models/business/BusinessProduct");
const router = express.Router();

router.post("/save", async (req, res) => {
  let body = req.body;
  let businessproduct = new BusinessProduct.BusinessProduct();
  businessproduct.id = body.data.id;
  businessproduct.businessid = body.data.businessid;
  businessproduct.igapvendorid = body.data.igapvendorid;
  businessproduct.businessproductid = body.data.businessproductid;
  businessproduct.businessproductcategoryid =
    body.data.businessproductcategoryid;
  businessproduct.name = body.data.name;
  businessproduct.title = body.data.name
    .toLowerCase()
    .replace(/[^\w\s]/gi, "-");
  businessproduct.title = businessproduct.title.replace(/ /gi, "-");
  businessproduct.description = body.data.description;
  businessproduct.specification = body.data.specification;
  businessproduct.mrp = body.data.mrp;
  businessproduct.price = body.data.price;
  businessproduct.weight = body.data.weight;
  businessproduct.imagecode = body.data.imagecode;
  businessproduct.instock = body.data.instock;
  businessproduct.affiliatepercent = body.data.affiliatepercent;
  businessproduct.save().then(
    (result) => {
      let data = {
        data: {
          status: "success",
          data: result,
        },
      };
      res.end(JSON.stringify(data));
    },
    (err) => {
      let data = {
        data: {
          status: "fail",
        },
      };
      res.end(JSON.stringify(data));
    }
  );
});

router.post("/list", async (req, res) => {
  let body = req.body;
  let businessproduct = new BusinessProduct.BusinessProduct();
  businessproduct.businessid = body.data.businessid;
  businessproduct.list().then(
    (result) => {
      let data = {
        data: {
          status: "success",
          data: result,
        },
      };
      res.end(JSON.stringify(data));
    },
    (err) => {
      let data = {
        data: {
          status: "fail",
        },
      };
      res.end(JSON.stringify(data));
    }
  );
});

router.post("/delete", async (req, res) => {
  let body = req.body;
  let businessproduct = new BusinessProduct.BusinessProduct();
  businessproduct.id = body.data.id;
  businessproduct.delete().then(
    (result) => {
      let data = {
        data: {
          status: "success",
          data: result,
        },
      };
      res.end(JSON.stringify(data));
    },
    (err) => {
      let data = {
        data: {
          status: "fail",
        },
      };
      res.end(JSON.stringify(data));
    }
  );
});

router.post("/changestatus", async (req, res) => {
  let body = req.body;
  let businessproduct = new BusinessProduct.BusinessProduct();
  businessproduct.id = body.data.id;
  businessproduct.status = body.data.status;
  businessproduct.changestatus().then(
    (result) => {
      let data = {
        data: {
          status: "success",
          data: result,
        },
      };
      res.end(JSON.stringify(data));
    },
    (err) => {
      let data = {
        data: {
          status: "fail",
        },
      };
      res.end(JSON.stringify(data));
    }
  );
});

router.post("/changeinstock", async (req, res) => {
  let body = req.body;
  let businessproduct = new BusinessProduct.BusinessProduct();
  businessproduct.id = body.data.id;
  businessproduct.instock = body.data.instock;
  businessproduct.changeinstock().then(
    (result) => {
      let data = {
        data: {
          status: "success",
          data: result,
        },
      };
      res.end(JSON.stringify(data));
    },
    (err) => {
      let data = {
        data: {
          status: "fail",
        },
      };
      res.end(JSON.stringify(data));
    }
  );
});

router.post("/updateaffiliatepercent", async (req, res) => {
  let body = req.body;
  let businessproduct = new BusinessProduct.BusinessProduct();
  businessproduct.id = body.data.id;
  businessproduct.affiliatepercent = body.data.affiliatepercent;
  businessproduct.updateaffiliatepercent().then(
    (result) => {
      let data = {
        data: {
          status: "success",
          data: result,
        },
      };
      res.end(JSON.stringify(data));
    },
    (err) => {
      let data = {
        data: {
          status: "fail",
        },
      };
      res.end(JSON.stringify(data));
    }
  );
});

router.post("/get", async (req, res) => {
  let body = req.body;
  let businessproduct = new BusinessProduct.BusinessProduct();
  businessproduct.id = body.data.id;
  businessproduct.get().then(
    (result) => {
      let data = {
        data: {
          status: "success",
          data: result,
        },
      };
      res.end(JSON.stringify(data));
    },
    (err) => {
      let data = {
        data: {
          status: "fail",
        },
      };
      res.end(JSON.stringify(data));
    }
  );
});

router.post("/vendorproductadded", async (req, res) => {
  let body = req.body;
  let businessproduct = new BusinessProduct.BusinessProduct();
  businessproduct.businessid = body.data.businessid;
  businessproduct.igapvendorproductid = body.data.igapvendorproductid;
  businessproduct.vendorproductadded().then(
    (result) => {
      let data = {
        data: {
          status: result
        },
      };
      res.end(JSON.stringify(data));
    },
    (err) => {
      let data = {
        data: {
          status: false,
        },
      };
      res.end(JSON.stringify(data));
    }
  );
});

module.exports = router;
