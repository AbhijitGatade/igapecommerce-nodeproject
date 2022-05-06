var express = require("express");
var Authentication = require("../../models/igap/Authentication");
const router = express.Router();

router.post("/login", async (req, res) => {
  let body = req.body;
  let authentication = new Authentication.Authentication();
  authentication.email = body.data.email;
  authentication.password = body.data.password;
  authentication.login().then(
    (result) => {
      res.end(JSON.stringify(result));
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
