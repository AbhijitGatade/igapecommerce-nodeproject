let Database = require("../Database");

class Authentication {
  email = "";
  password = "";

  query = "";
  db = new Database.Database();

  constructor() {
    this.email = "";
    this.password = "";
  }

  login = () => {
    this.query = "SELECT * FROM admins WHERE username = '" + this.email + "' AND password = '" + this.password + "'";
    return new Promise((resolve, reject) => {
      this.db.query(this.query, (err, result) => {
        if (err){
          this.db.close();
          return reject(err)
        }
        if(result.length > 0){
          this.db.close();
          resolve({data:{status:"success", role:"admin", data:result}});
        }
        else{
          this.query = "SELECT * FROM businesses WHERE email = '" + this.email + "' AND password = '" + this.password + "'";
          this.db.query(this.query, (err, result) => {
            if (err){
              this.db.close();
              return reject(err)
            }
            if(result.length > 0){
              this.db.close();
              resolve({data:{status:"success", role:"business", data:result}});
            }
            else{
              this.query = "SELECT * FROM igap_vendors WHERE email = '" + this.email + "' AND password = '" + this.password + "'";
              this.db.query(this.query, (err, result) => {
                if (err){
                  this.db.close();
                  return reject(err)
                }
                if(result.length > 0){
                  this.db.close();
                  resolve({data:{status:"success", role:"vendor", data:result}});
                }
                else{
                  resolve({data:{status:"failed"}});
                }
            });
          }
        });
      }
      });
    });
  };
}

module.exports = {
  Authentication: Authentication
};
