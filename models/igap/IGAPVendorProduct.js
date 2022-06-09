const Database = require("../Database");
var fs = require("fs");

class IGAPVendorProduct {

  id = 0;
  name = "";
  title = "";
  description = "";
  specification = "";
  picpath = "";
  imagecode = "";
  igapvendorid = 0;
  mrp = 0;
  price = 0;
  weight = 0;
  instock = "";
  status = "";
  igaproductcategoryid = 0;

  db = new Database.Database();

  constructor() {
    this.id = 0;
    this.igapvendorid = 0;
    this.igaproductcategoryid = 0;
    this.name = "";
    this.title = "";
    this.description = "";
    this.specification = "";
    this.picpath = "";
    this.imagecode = "";
    this.mrp = 0;
    this.price = 0;
    this.weight = 0;
    this.instock = "";
    this.status = "";    
  }

  save = () => {
    if(this.imagecode != ""){
      let base64image = this.imagecode.replace(/^data:image\/jpeg;base64,/, "");
      base64image = base64image.replace(/^data:image\/png;base64,/, "");
      this.picpath = "vendorproducts/" + Math.random().toString(36).substring(2, 7) + ".png";
      fs.writeFile("public/" + this.picpath, base64image, 'base64', function (err) {
          console.log("Error image saving-" + err);
      });
    }

    if (this.id == 0) {
        this.query = "INSERT INTO igap_vendorproducts(igapvendorid, igaproductcategoryid, name, title, description, specification, picpath, mrp, price, weight, instock, status) ";
        this.query += "VALUES(" + this.igapvendorid + ", " + this.igaproductcategoryid + ", '" + this.name + "', '" + this.title + "', ";
        this.query += "'" + this.description + "', '" + this.specification + "', '" + this.picpath + "', " + this.mrp + ", " + this.price + ", " + this.weight + ", '" + this.instock + "', 'open')";
    } 
    else {
      this.query = "UPDATE igap_vendorproducts SET igapvendorid = " + this.igapvendorid + ", ";
      this.query += "igaproductcategoryid = " + this.igaproductcategoryid + ", ";
      this.query += "name = '" + this.name + "', ";
      this.query += "title = '" + this.title + "', ";
      this.query += "description = '" +  this.description + "', ";
      this.query += "specification = '" + this.specification + "', ";
      if(this.picpath != "")
          this.query += "picpath = '" + this.picpath + "', ";
      this.query += "mrp = " + this.mrp + ", ";
      this.query += "price = " + this.price + ", ";
      this.query += "weight = " + this.weight + ", ";
      this.query += "instock = '" + this.instock + "' ";
      this.query += " WHERE id =" + this.id;
    }

    console.log(this.query);
    return new Promise((resolve, reject) => {
      this.db.query(this.query, (err, result) => {
        this.db.close();
        if (err) {
          return reject(err);
        }
        resolve(result);
      });
    });
  };

  list = () => {
    this.query = "SELECT VP.*, PC.name AS categoryname, ";
    this.query += "(SELECT COUNT(*) FROM igap_vendorproductpictures AS VPP WHERE VPP.productid = VP.id) AS picturecount, ";
    this.query += "(SELECT COUNT(*) FROM igap_vendorproductvarieties AS VPV WHERE VPV.productid = VP.id) AS varietycount ";
    this.query += "FROM igap_productcategories AS PC, igap_vendorproducts AS VP WHERE PC.id = VP.igaproductcategoryid ";
    if(this.igapvendorid != 0)
        this.query += "AND igapvendorid = " + this.igapvendorid + " ";
    this.query += "ORDER BY VP.name";
    return new Promise((resolve, reject) => {
      this.db.query(this.query, (err, result) => {
        this.db.close();
        if (err) {
          return reject(err);
        }
        resolve(result);
      });
    });
  };

  
  changestatus = () => {
    this.query = "UPDATE igap_vendorproducts SET status = '" + this.status + "' WHERE id = " + this.id;
    return new Promise((resolve, reject) => {
      this.db.query(this.query, (err, result) => {
        this.db.close();
        if (err) reject(err);
        resolve(result);
      });
    });
  };

  changeinstock = () => {
    this.query = "UPDATE igap_vendorproducts SET instock = '" + this.instock + "' WHERE id = " + this.id;
    return new Promise((resolve, reject) => {
      this.db.query(this.query, (err, result) => {
        this.db.close();
        if (err) reject(err);
        resolve(result);
      });
    });
  };

  delete = () => {
    this.query = "DELETE FROM igap_vendorproducts WHERE id = " + this.id;
    return new Promise((resolve, reject) => {
      this.db.query(this.query, (err, result) => {
        this.db.close();
        if (err) {
          return reject(err);
        }
        resolve(result);
      });
    });
  };

  get = () => {
    this.query = "SELECT * FROM igap_vendorproducts WHERE id = " + this.id;
    return new Promise((resolve, reject) => {
      this.db.query(this.query, (err, result) => {
        this.db.close();
        if (err) {
          return reject(err);
        }
        resolve(result);
      });
    });
  };
}

module.exports = {
  IGAPVendorProduct: IGAPVendorProduct
};
