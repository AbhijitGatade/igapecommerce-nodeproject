const Database = require("../Database");

class Pincode {
    id = 0;
    pincode = "";
    stateid = 0;
    districtid = 0;
    query = "";
    db = new Database.Database();

    constructor() {
        this.id = 0;
        this.pincode = "";
        this.stateid = 0;
        this.districtid = 0;
    }

    save = () => {
        
        if (this.id == 0) {
            this.query = "INSERT INTO pincodes(pincode, stateid, districtid) ";
            this.query += "VALUES('" + this.pincode + "'," + this.stateid + ", " + this.districtid + ")";
        }
        else {
            this.query = "UPDATE pincodes SET  pincode = '" + this.pincode + "', ";
            this.query += "stateid = '" + this.stateid + "', ";
            this.query += "districtid = '" + this.districtid + "' ";
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
        this.query = "SELECT P.*, S.name AS statename, D.name AS districtname ";
        this.query += "FROM pincodes AS P, states AS S, districts AS D ";
        this.query += "WHERE P.stateid = S.id AND P.districtid = D.id ";
        if(this.districtid != 0)
            this.query += "AND D.id = " + this.districtid + " ";
        this.query += "ORDER BY pincode";
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
        this.query = "DELETE FROM pincodes WHERE id = " + this.id;
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
        this.query = "SELECT * FROM pincodes WHERE id = " + this.id;
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
    Pincode: Pincode
}