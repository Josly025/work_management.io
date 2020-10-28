// util package - enables us to use promisify
const util = require("util");

const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost", //host server

  port: 3306, //Your PORT;

  user: "root", //User

  password: "Grantjos12", //db password - user
  database: "employee_tracker",
});

//using connection variable and calling connection
connection.connect();

// Setting up connection.query to use promises instead of callbacks
// This allows us to use the async/await syntax
connection.query = util.promisify(connection.query);

//promisify method - util package that callback
module.exports = connection;
