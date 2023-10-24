const mysql = require("mysql2/promise");

const dbConnect = async () => {
  try {
    const connection = await mysql.createConnection({
      host: "db",
      user: "qmsc_root",
      password: "qmsc_pass",
      database: "qmsc",
    });
    console.log("mysql connection success");
    const [result] = await connection.query("SELECT * FROM Customers;")
    console.log("Query ==>", result)
  } catch (error) {
    console.log(error);
  }

  process.exit(0)
};

dbConnect();