const util = require("util");
const mysql = require("mysql");

const connection = mysql.createConnection({
  //host server
  host: "localhost",

  //Your PORT;
  port: 3306,

  //User
  user: "root",

  //PASSWORD
  password: "Grantjos12",
  database: "employee_tracker",
});

connection.connect();

// Setting up connection.query to use promises instead of callbacks
// This allows us to use the async/await syntax
connection.query = util.promisify(connection.query);

module.exports = connection;
