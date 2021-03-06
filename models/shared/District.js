let Database = require("../Database");

class District {

    id = 0;
    name = "";
    stateid = 0;

    db = new Database.Database();

    constructor(){
        this.id = 0;
        this.name = "";
        this.stateid = 0;
    }

    save=()=>{
        if(this.id==0){
            this.query = "INSERT INTO districts(name, stateid)  ";
           this.query+= "VALUES('"+ this.name +"', " + this.stateid + ")"; 
        }
        else {
            this.query = "UPDATE districts SET name = '" + this.name + "', ";
            this.query += "stateid = " + this.stateid + " ";
            this.query += "WHERE id = " + this.id;
        }
        return new Promise((resolve, reject)=>{
            this.db.query(this.query, (err, result)=>{
                this.db.close();
                if(err)
                    return reject(err);                
                resolve(result);
            });
        });           
    }

    get=()=>{
        this.query = "SELECT * FROM districts WHERE id = " + this.id;
        return new Promise((resolve, reject)=>{
            this.db.query(this.query, (err, result)=>{
                this.db.close();
                if(err)
                    return reject(err);                
                resolve(result);
            });
        });           
    }

    list=()=>{
        this.query = "SELECT D.*, (SELECT COUNT(*) FROM pincodes AS P WHERE P.districtid = D.id) AS pincodecount, ";
        this.query += "S.name AS statename FROM districts AS D, states AS S WHERE D.stateid = S.id ";
        if(this.stateid != 0)
            this.query += "AND D.stateid = " + this.stateid + " ";
        this.query += "ORDER BY D.name";
        console.log(this.query);
        return new Promise((resolve, reject)=>{
            this.db.query(this.query, (err, result)=>{
                this.db.close();
                if(err)
                    return reject(err);                
                resolve(result);
            });
        });           
    }
    
    delete=()=>{
        this.query = "DELETE FROM districts WHERE id = " + this.id;
        return new Promise((resolve, reject)=>{
            this.db.query(this.query, (err, result)=>{
                this.db.close();
                if(err)
                    return reject(err);                
                resolve(result);
            });
        });           
    }
}
module.exports={
    District:District
}