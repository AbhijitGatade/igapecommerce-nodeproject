let Database = require("../Database");

class State{
    id = 0;
    name = "";  
    db = new Database.Database();
    constructor(){
        this.id = 0;
        this.name = "";
    }
    save=()=>{
        if(this.id == 0){
            this.query = "INSERT INTO states(name)  VALUES('" + this.name + "')"; 
        }
        else {
            this.query = "UPDATE states SET name = '" + this.name +"' WHERE id = " + this.id;
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
        this.query = "SELECT * FROM states AS S WHERE S.id = " + this.id;
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
        this.query =  "SELECT *, (SELECT COUNT(*) FROM districts WHERE stateid = S.id) AS districtcount, ";
        this.query += "(SELECT COUNT(*) FROM cities WHERE stateid = S.id) AS citycount ";
        this.query +=  "FROM states AS S ORDER BY name";
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
        this.query = "DELETE FROM states WHERE id = " + this.id;
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
    State:State
}