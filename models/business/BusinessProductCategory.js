const Database = require("../Database");
var fs = require("fs");

class BusinessProductCategory {

    id = 0;
    businessid = 0;
    srno = 0;
    picpath = "";
    name = "";
    imagecode = "";
    igaproductcategoryid = 0;

    db = new Database.Database();

    constructor() {
        this.id = 0;
        this.businessid = 0;
        this.srno = 0;
        this.picpath = "";
        this.imagecode = "";
        this.name = "";
        this.igaproductcategoryid = 0;
    }

    save = () => {
        if (this.imagecode != "") {
            let base64image = this.imagecode.replace(/^data:image\/jpeg;base64,/, "");
            base64image = base64image.replace(/^data:image\/png;base64,/, "");
            this.picpath = "businessproductcategories/" + Math.random().toString(36).substring(2, 7) + ".png";
            fs.writeFile("public/" + this.picpath, base64image, 'base64', function (err) {
                console.log("Error image saving-" + err);
            });
        }
        if (this.id == 0) {
            this.query = "INSERT INTO business_productcategories(businessid, srno, picpath, name, igaproductcategoryid) ";
            this.query += "VALUES(" + this.businessid + ", " + this.srno + ", '" + this.picpath + "', '" + this.name + "', " + this.igaproductcategoryid + ")";
        }
        else {
            this.query = "UPDATE business_productcategories SET  businessid = " + this.businessid + ", ";
            this.query += "name = '" + this.name + "', ";
            this.query += "srno = " + this.srno + ",";
            if (this.picpath != "")
                this.query += "picpath = '" + this.picpath + "' ";

            this.query += "WHERE id = " + this.id;
        }
        return new Promise((resolve, reject) => {
            this.db.query(this.query, (err, result) => {
                this.db.close();
                if (err) {
                    return reject(err)
                };
                resolve(result);
            });
        });
    }

    list = () => {
        this.query = "SELECT * FROM business_productcategories ";
        this.query += "WHERE businessid = " + this.businessid + " ORDER BY srno";
        return new Promise((resolve, reject) => {
            this.db.query(this.query, (err, result) => {
                this.db.close();
                if (err)
                    reject(err);
                resolve(result);
            });
        });
    }

    copy = (categoryid) => {
        this.query = "INSERT INTO business_productcategories(businessid, srno, picpath, name, igaproductcategoryid) ";
        this.query += "SELECT " + this.businessid + ", 1, picpath, name, " + categoryid + " FROM igap_productcategories WHERE id = " + categoryid;
        return new Promise((resolve, reject) => {
            this.db.query(this.query, (err, result) => {
                this.db.close();
                if (err)
                    reject(err);
                resolve(result);
            });
        });
    }

    listtocopy = () => {
        this.query = "SELECT * FROM igap_productcategories ";
        this.query += "WHERE id NOT IN(SELECT igaproductcategoryid FROM business_productcategories WHERE businessid = " + this.businessid + ")";
        return new Promise((resolve, reject) => {
            this.db.query(this.query, (err, result) => {
                this.db.close();
                if (err)
                    reject(err);
                resolve(result);
            });
        });
    }

    delete = () => {
        this.query = "DELETE FROM business_productcategories WHERE id = " + this.id;
        return new Promise((resolve, reject) => {
            this.db.query(this.query, (err, result) => {
                this.db.close();
                if (err)
                    reject(err);
                resolve(result);
            });
        });
    }
    
    get = () => {
        this.query = "SELECT * FROM business_productcategories WHERE id = " + this.id;
        return new Promise((resolve, reject) => {
            this.db.query(this.query, (err, result) => {
                this.db.close();
                if (err)
                    reject(err);
                resolve(result);
            });
        });
    }
}

module.exports = {
    BusinessProductCategory: BusinessProductCategory
}