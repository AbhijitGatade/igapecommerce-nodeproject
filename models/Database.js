var mysql = require("mysql");

class Database {
    constructor() {
        this.con = mysql.createConnection({
            host: "mysql5046.site4now.net",
            user: "a66bc3_igecomm",
            password: "admin123",
            database: "db_a66bc3_igecomm"
        });
    }

    query = (sql,args) => {
        return new Promise((resolve,rejects)=>{
            this.con.query(sql,args,function(err, result){            
                if (err) {                   
                    return rejects(err);
                }
                resolve(result);
            //    console.log(result);
            });           
        });
    }

    close(){
        return new Promise((resolve,rejects)=>{
            this.con.end((err)=>{
                if(err){
                    rejects(err);
                }
                resolve("success");
            });
        });
    }
}

module.exports = {
    Database: Database
}
