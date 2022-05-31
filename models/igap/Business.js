const Database = require("../Database");

class Business {
    id = 0;
    name = "";
    website = "";
    address = "";
    cityid = "";
    email = "";
    mobileno = "";
    password = "";    
    pincode = "";

    query = "";
    db = new Database.Database();

    constructor() {
        this.id = 0;
        this.name = "";
        this.website = "";
        this.address = "";
        this.cityid = "";
        this.email = "";
        this.mobileno = "";
        this.password = "";    
        this.pincode = "";
    }

    save = () => {
        
        if (this.id == 0) {
            this.query = "INSERT INTO businesses(name, website, address, cityid, pincode, joiningdate, expirydate, email, mobileno, password, status) ";
            this.query += "VALUES('" + this.name + "','" + this.website + "', '" + this.address + "', ";
            this.query += "'" + this.cityid + "', '" + this.pincode + "', ";
            this.query += "curdate(), SUBDATE(CURDATE(), -365), '" + this.email + "', ";
            this.query += "'" + this.mobileno + "','" + this.password + "', 'active')";
        }
        else {
            this.query = "UPDATE businesses SET  name = '" + this.name + "', ";
            this.query += "website = '" + this.website + "', ";
            this.query += "address = '" + this.address + "', ";
            this.query += "cityid = '" + this.cityid + "', ";
            this.query += "pincode = '" + this.pincode + "', ";
            this.query += "email = '" + this.email + "', ";
            this.query += "mobileno = '" + this.mobileno + "', ";
            this.query += "password = '" + this.password + "', ";
            this.query += "pincode = '" + this.status + "' ";
            this.query += "WHERE id =" + this.id;
        }
        return new Promise((resolve, reject) => {
            this.db.query(this.query, (err, result) => {
                this.db.close();
                if (err) {
                    return reject(err)
                }
                resolve(result);
            });
        });
    }

    list = () => {
        this.query = "SELECT B.*, (SELECT name FROM cities WHERE cities.id = cityid) AS cityname, ";
        this.query += "DATE_FORMAT(joiningdate, '%d/%m/%Y') AS joiningdatedisplay, DATE_FORMAT(expirydate, '%d/%m/%Y') AS expdatedisplay ";
        this.query += "FROM businesses AS B ORDER BY joiningdate";
        console.log(this.query);
        return new Promise((resolve, reject) => {
            this.db.query(this.query, (err, result) => {
                this.db.close();
                if (err)
                    reject(err);
                resolve(result);
            });
        });
    }

    delete = ()=>{
        this.query = "DELETE FROM businesses WHERE id = " + this.id;
        return new Promise((resolve, reject)=>{
            this.db.query(this.query, (err, result)=>{
                this.db.close();
                if(err)
                    reject(err);                
                resolve(result);
            });
        });         
    }

    changestatus = ()=>{
        this.query = "UPDATE businesses SET status = '" + this.status + "' WHERE id = " + this.id;
        return new Promise((resolve, reject)=>{
            this.db.query(this.query, (err, result)=>{
                this.db.close();
                if(err)
                    reject(err);                
                resolve(result);
            });
        });         
    }


    get=()=>{
        this.query = "SELECT * FROM businesses WHERE id = " + this.id;
        return new Promise((resolve, reject)=>{
            this.db.query(this.query, (err, result)=>{
                this.db.close();
                if(err)
                    reject(err);                
                resolve(result);
            });
        });  
    }
}
module.exports = {
    Business: Business
}