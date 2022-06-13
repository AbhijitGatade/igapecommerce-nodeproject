var express = require("express");
var Pincode = require("../../models/igap/Pincode");
const router = express.Router();

router.post("/save", async (req, res) => {
  let body = req.body;
  let pincode = new Pincode.Pincode();
  pincode.id = body.data.id;
  pincode.pincode = body.data.pincode;
  pincode.stateid = body.data.stateid;
  pincode.districtid = body.data.districtid;
  pincode.save().then(
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
  let pincode = new Pincode.Pincode();
  pincode.districtid = body.data.districtid;
  pincode.list().then(
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
  let pincode = new Pincode.Pincode();
  pincode.id = body.data.id;
  pincode.delete().then(
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
  let pincode = new Pincode.Pincode();
  pincode.id = body.data.id;
  pincode.get().then(
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

module.exports = router;
