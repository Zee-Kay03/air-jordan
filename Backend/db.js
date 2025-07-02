const mysql = require("mysql2/promise");

const db = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "Muhammad20",
  database: "AirportManagement",
});

module.exports = db;
